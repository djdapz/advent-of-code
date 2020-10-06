//
// Created by Devon Dapuzzo on 10/2/20.
//

import Foundation

func bestSteps(_ a: Wire, _ b: Wire) -> Int {
    intersections(a, b).map {
        let to: Int = b.stepsTo($0)
        let to2: Int = a.stepsTo($0)
        return to + to2
    }.min() ?? 0
}

func intersections(_ a: Wire, _ b: Wire) -> [Point] {
    a.segments.flatMap { segmentA in
        b.segments.compactMap { segmentB in
            intersection(segmentB, segmentA)
        }
    }
}

func intersection(_ a: Segment, _ b: Segment) -> Point? {
    guard let segments = SegmentPair(a, b),
          segments.horizontalYPosition > segments.bottom
                  && segments.horizontalYPosition < segments.top
                  && segments.verticalXPosition > segments.left
                  && segments.verticalXPosition < segments.right
            else { return nil }

    return Point(x: segments.verticalXPosition, y: segments.horizontalYPosition)
}

struct Wire {
    let segments: [Segment]

    init(specs: [String]) {
        self.segments = specs.reduce(([], Point(x: 0, y: 0))) { (accumulator, spec) in
            let (runningSegments, prevSegment) = accumulator
            let next = segmentFrom(spec, startingPoint: prevSegment)
            return (runningSegments + [next], next.end)
        }.0
    }

    public func stepsTo(_ point: Point) -> Int {
        segments.reduce((0, false)) { result, segment in
            let (steps, hasFoundEnd) = result

            if hasFoundEnd {
                return result
            }

            if let distanceFromStartToPoint = segment.distanceFromStartToPoint(point) {
                return (steps + distanceFromStartToPoint, true)
            }

            return (steps + segment.length, false)
        }.0
    }
}

struct Point: Equatable {
    let x: Int
    let y: Int
    var manhattanDistanceToOrigin: Int { abs(x) + abs(y) }
}

struct SegmentPair {

    let verticalSegment: VerticalSegment
    let horizontalSegment: HorizontalSegment

    var top: Int { Swift.max(verticalSegment.start.y, verticalSegment.end.y) }
    var bottom: Int { Swift.min(verticalSegment.start.y, verticalSegment.end.y) }
    var right: Int { Swift.max(horizontalSegment.start.x, horizontalSegment.end.x) }
    var left: Int { Swift.min(horizontalSegment.start.x, horizontalSegment.end.x) }

    var verticalXPosition: Int { verticalSegment.start.x }
    var horizontalYPosition: Int { horizontalSegment.start.y }

    init?(_ a: Segment, _ b: Segment) {
        let segments = [a, b]
        guard let vertical = segments.first(where: { $0 is VerticalSegment }) as? VerticalSegment,
              let horizontal = segments.first(where: { $0 is HorizontalSegment }) as? HorizontalSegment else {
            return nil
        }

        self.verticalSegment = vertical
        self.horizontalSegment = horizontal
    }
}

protocol Segment {
    func distanceFromStartToPoint(_ point: Point) -> Int?
    var length: Int { get }
    var start: Point { get }
    var end: Point { get }
}

func segmentFrom(_ spec: String, startingPoint start: Point = Point(x: 0, y: 0)) -> Segment {
    let count = spec.dropFirst().toString().asInt()
    switch spec.first {
    case "U":
        return VerticalSegment(start: start, end: Point(x: start.x, y: count + start.y))
    case "D":
        return VerticalSegment(start: start, end: Point(x: start.x, y: start.y - count))
    case "L":
        return HorizontalSegment(start: start, end: Point(x: start.x - count, y: start.y))
    case "R":
        return HorizontalSegment(start: start, end: Point(x: start.x + count, y: start.y))
    default:
        fatalError("unrecognized direction building wire: \(spec)")
    }
}

struct VerticalSegment: Segment, Equatable {
    let start: Point
    let end: Point
    var length: Int { abs(self.start.y - self.end.y) }

    func distanceFromStartToPoint(_ point: Point) -> Int? {
        guard point.x == start.x,
              point.y <= max(start.y, end.y),
              point.y >= min(start.y, end.y)
                else {
            return nil
        }

        return abs(point.y - self.start.y)
    }
}

struct HorizontalSegment: Segment, Equatable {

    let start: Point
    let end: Point
    var length: Int { abs(self.start.x - self.end.x) }

    func distanceFromStartToPoint(_ point: Point) -> Int? {
        guard point.y == start.y,
              point.x <= max(start.x, end.x),
              point.x >= min(start.x, end.x)
                else {
            return nil
        }

        return abs(point.x - self.start.x)
    }
}