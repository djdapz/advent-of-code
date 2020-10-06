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
    a.segments.flatMap { intersections(wire: b, segment: $0) }
}

func intersections(wire: Wire, segment: Segment) -> [Point] {
    wire.segments.compactMap { intersection($0, segment) }
}

func intersection(_ a: Segment, _ b: Segment) -> Point? {
    guard let segments = SegmentPair.from(a, b),
          segments.horizontalYPosition > segments.bottom
                  && segments.horizontalYPosition < segments.top
                  && segments.verticalXPosition > segments.left
                  && segments.verticalXPosition < segments.right
            else { return nil }

    return Point(x: segments.verticalXPosition, y: segments.horizontalYPosition)
}

struct Wire {
    let segments: [Segment]

    init(specs: [String], startingAt: Point = Point(x: 0, y: 0)) {
        guard let first = specs.first else {
            segments = []
            return
        }

        let segment = segmentFrom(first, startingPoint: startingAt)
        let rest = Wire(specs: Array(specs.dropFirst()), startingAt: segment.end)

        segments = [segment] + rest.segments
    }

    public func stepsTo(_ point: Point) -> Int {
        var steps = 0

        for segment in segments {
            if let distanceFromStartToPoint = segment.distanceFromStartToPoint(point) {
                steps += distanceFromStartToPoint
                return steps
            } else {
                steps += segment.length
            }
        }

        return steps
    }
}

struct Point: Equatable {
    let x: Int
    let y: Int
    var manhattanDistanceToOrigin: Int {
        abs(x) + abs(y)
    }
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

    private init(verticalSegment: VerticalSegment, horizontalSegment: HorizontalSegment) {
        self.verticalSegment = verticalSegment
        self.horizontalSegment = horizontalSegment
    }

    static func from(_ a: Segment, _ b: Segment) -> SegmentPair? {
        let segments = [a, b]
        guard let vertical = segments.first(where: { $0 is VerticalSegment }) as? VerticalSegment,
              let horizontal = segments.first(where: { $0 is HorizontalSegment }) as? HorizontalSegment else {
            return nil
        }
        return SegmentPair(verticalSegment: vertical, horizontalSegment: horizontal)
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

    func distanceFromStartToPoint(_ point: Point) -> Int? {
        guard point.y == start.y,
              point.x <= max(start.x, end.x),
              point.x >= min(start.x, end.x)
                else {
            return nil
        }

        return abs(point.x - self.start.x)
    }

    var length: Int {
        abs(self.start.y - self.end.y)
    }
}

struct HorizontalSegment: Segment, Equatable {

    let start: Point
    let end: Point

    func distanceFromStartToPoint(_ point: Point) -> Int? {
        guard point.y == start.y,
              point.x <= max(start.x, end.x),
              point.x >= min(start.x, end.x)
                else {
            return nil
        }

        return abs(point.x - self.start.x)
    }

    var length: Int {
        abs(self.start.x - self.end.x)
    }

}


extension Substring {
    func toString() -> String {
        String(self)
    }
}

extension String {
    func asInt() -> Int {
        Int(self)!
    }
}
