import XCTest
@testable import swift_2019

final class wireTests: XCTestCase {

    func testGivesNullWhenToWiresDontCross() {
        let wire1 = Wire(
                specs: ["R5", "U3", "R5"]
        )
        let wire2 = Wire(
                specs: ["U5", "L3", "D3"]
        )

        XCTAssertEqual(intersections(wire1, wire2), [])
    }


    func testGivesIntersection() {
        let wire1 = Wire(
                specs: ["R5", "U5"]
        )
        let wire2 = Wire(
                specs: ["U2", "R10"]
        )

        XCTAssertEqual(intersections(wire1, wire2), [Point(x: 5, y: 2)])
    }

    func testGivesMultipleIntersections() {
        let wire1 = Wire(
                specs: ["R5", "U5", "R5"]
        )
        let wire2 = Wire(
                specs: ["U3", "R7", "U10"]
        )

        XCTAssertEqual(intersections(wire1, wire2), [Point(x: 5, y: 3), Point(x: 7, y: 5)])
    }

    func testBasicWireCanBeCreated() {
        let wire = Wire(
                specs: ["R5", "U3", "D3"]
        )

        assertSegmentsEqual(wire.segments, [
            HorizontalSegment(
                    start: Point(x: 0, y: 0),
                    end: Point(x: 5, y: 0)
            ),
            VerticalSegment(
                    start: Point(x: 5, y: 0),
                    end: Point(x: 5, y: 3)
            ),
            VerticalSegment(
                    start: Point(x: 5, y: 3),
                    end: Point(x: 5, y: 0)
            )
        ])
    }

    func testCreatingAnUpSegmentFromTheOrigin() {
        let up = segmentFrom("U2")
        let expectedUp = VerticalSegment(
                start: Point(x: 0, y: 0),
                end: Point(x: 0, y: 2)
        )

        assertSegmentsEqual(up, expectedUp)
    }


    func testCreatingADownSegmentFromTheOrigin() {
        let up = segmentFrom("D4")
        let expectedUp = VerticalSegment(
                start: Point(x: 0, y: 0),
                end: Point(x: 0, y: -4)
        )

        assertSegmentsEqual(up, expectedUp)
    }


    func testCreatingARightSegmentFromTheOrigin() {
        let segment = segmentFrom("R3")
        let expected = HorizontalSegment(
                start: Point(x: 0, y: 0),
                end: Point(x: 3, y: 0)
        )

        assertSegmentsEqual(segment, expected)
    }

    func testCreatingAleftSegmentFromTheOrigin() {
        let segment = segmentFrom("L5")
        let expected = HorizontalSegment(
                start: Point(x: 0, y: 0),
                end: Point(x: -5, y: 0)
        )

        assertSegmentsEqual(segment, expected)
    }


    func test_parallelVerticalLinesDontINtersect() {
        let vertical1 = segmentFrom("U4", startingPoint: Point(x: 0, y: 0))
        let vertical2 = segmentFrom("U4", startingPoint: Point(x: 1, y: 0))

        let actual = intersection(vertical1, vertical2)

        XCTAssertNil(actual)
    }

    func test_parallelHorizontalLinesDontINtersect() {
        let horizontal1 = segmentFrom("R4", startingPoint: Point(x: 0, y: 1))
        let horizontal2 = segmentFrom("R4", startingPoint: Point(x: 0, y: 0))

        let actual = intersection(horizontal1, horizontal2)

        XCTAssertNil(actual)
    }


    func test_LinesThatDontCrossDontIntersect() {
        let line1 = segmentFrom("U4", startingPoint: Point(x: 1, y: 0))
        let line2 = segmentFrom("R4", startingPoint: Point(x: 0, y: 1))

        let actual = intersection(line1, line2)
        let expectedIntersection = Point(x: 1, y: 1)

        XCTAssertEqual(actual, expectedIntersection)
    }

    func test_verticalLineAboveHOrizionatlDoesntMatch() {
        let line1 = segmentFrom("R4", startingPoint: Point(x: 0, y: 0))
        let line2 = segmentFrom("U4", startingPoint: Point(x: 3, y: 1))

        let actual = intersection(line1, line2)

        XCTAssertNil(actual)
    }


    func test_verticalLineBelowHOrizionatlDoesntMatch() {
        let line1 = segmentFrom("R4", startingPoint: Point(x: 0, y: 3))
        let line2 = segmentFrom("D4", startingPoint: Point(x: 3, y: 1))

        let actual = intersection(line1, line2)

        XCTAssertNil(actual)
    }

    func test_horizontalLineLeftDoesntMatch() {
        let line1 = segmentFrom("U4", startingPoint: Point(x: 0, y: 0))
        let line2 = segmentFrom("R4", startingPoint: Point(x: -6, y: 2))

        let actual = intersection(line1, line2)

        XCTAssertNil(actual)
    }


    func test_horizontalLineRightDoesntMatch() {
        let line1 = segmentFrom("U4", startingPoint: Point(x: 10, y: 0))
        let line2 = segmentFrom("R4", startingPoint: Point(x: 1, y: 2))

        let actual = intersection(line1, line2)

        XCTAssertNil(actual)
    }

    func test_pointKnowsItsOwnManhattanDistance() {
        let point = Point(x: -5, y: -121)

        XCTAssertEqual(point.manhattanDistanceToOrigin, 126)
    }

    func test_stepsForAWire() {
        let wire = Wire.init(specs: ["U5", "R3", "D3"])
        let steps = wire.stepsTo(Point(x: 3, y: 4))
        XCTAssertEqual(steps, 9)
    }

    func test_stepsForPointOnALine() {
        let point: Point = Point(x: 0, y: 4)
        let from = segmentFrom("U5")
        let distance: Int? = from.distanceFromStartToPoint(point)
        XCTAssertEqual(4, distance)
//        XCTAssertEqual(4, segmentFrom("R5").distanceFromStartToPoint(Point(x: 4, y: 0)))
//        XCTAssertEqual(4, segmentFrom("D5").distanceFromStartToPoint(Point(x: 0, y: -4)))
//        XCTAssertEqual(4, segmentFrom("L5").distanceFromStartToPoint(Point(x: -4, y: 0)))
    }

    func test_pointsNotOnLIne() {
//        off line
        XCTAssertEqual(nil, segmentFrom("U5").distanceFromStartToPoint(Point(x: 1, y: 4)))
        XCTAssertEqual(nil, segmentFrom("R5").distanceFromStartToPoint(Point(x: 4, y: 1)))

//        too big
        XCTAssertEqual(nil, segmentFrom("U5").distanceFromStartToPoint(Point(x: 0, y: 6)))
        XCTAssertEqual(nil, segmentFrom("R5").distanceFromStartToPoint(Point(x: 6, y: 0)))

//        too small
        XCTAssertEqual(nil, segmentFrom("U5").distanceFromStartToPoint(Point(x: 0, y: -4)))
        XCTAssertEqual(nil, segmentFrom("R5").distanceFromStartToPoint(Point(x: -3, y: 0)))
    }

    func test_stepsRegression_1() {
        let wire = Wire(specs: ["U7", "R6", "D4", "L4"])
        let point = Point(x: 3, y: 3)

        XCTAssertEqual(wire.stepsTo(point), 20)
    }


    func test_stepsRegression_2() {
        let wire = Wire(specs: ["U7", "R6", "D4", "L4"])
        let point = Point(x: 3, y: 3)


        XCTAssertEqual(wire.stepsTo(point), 20)
    }

    func test_regressionsForBestSteps() {
        let wire1 = Wire(specs: ["U7", "R6", "D4", "L4"])
        let wire2 = Wire(specs: ["R8", "U5", "L5", "D3"])

        XCTAssertEqual(bestSteps(wire1, wire2), 30)
    }

    func test_regressionsForBestSteps_2() {
        let wire1 = Wire(specs: ["R75", "D30", "R83", "U83", "L12", "D49", "R71", "U7", "L72"])
        let wire2 = Wire(specs: ["U62", "R66", "U55", "R34", "D71", "R55", "D58", "R83"])

        XCTAssertEqual(bestSteps(wire1, wire2), 610)
    }

    func test_regressionsForBestSteps_3() {
        let wire1 = Wire(specs: ["R98", "U47", "R26", "D63", "R33", "U87", "L62", "D20", "R33", "U53", "R51"])
        let wire2 = Wire(specs: ["U98", "R91", "D20", "R16", "D67", "R40", "U7", "R15", "U6", "R7"])

        XCTAssertEqual(bestSteps(wire1, wire2), 410)
    }

    func assertSegmentsEqual(_ a: Segment, _ b: Segment) {
        if let aVert = a as? VerticalSegment,
           let bVert = b as? VerticalSegment {
            XCTAssertEqual(aVert, bVert)
            return
        }

        if let aHoriz = a as? HorizontalSegment,
           let bHoriz = b as? HorizontalSegment {
            XCTAssertEqual(aHoriz, bHoriz)
            return
        }

        XCTFail("the segments are not of the same type: \(a) and \(b)")
    }


    func assertSegmentsEqual(_ a: [Segment], _ b: [Segment]) {
        a.enumerated().forEach { (offset: Int, element: Segment) in
            let segmentA: Segment = element
            let segmentB: Segment = b[offset]
            return assertSegmentsEqual(segmentA, segmentB)
        }
    }


}
