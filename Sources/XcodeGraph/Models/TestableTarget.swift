import Foundation
import Path

/// Testable target describe target and tests information.
public struct TestableTarget: Equatable, Hashable, Codable, Sendable {
    /// The target name and its project path.
    public let target: TargetReference
    /// Skip test target from TestAction.
    public let isSkipped: Bool
    /// The parallelization option for running the tests.
    public let parallelizable: Parallelizable
    /// Execute tests in random order.
    public let isRandomExecutionOrdering: Bool
    /// A simulated location used when testing this test target.
    public let simulatedLocation: SimulatedLocation?

    public init(
        target: TargetReference,
        skipped: Bool = false,
        parallelizable: Parallelizable = .none,
        randomExecutionOrdering: Bool = false,
        simulatedLocation: SimulatedLocation? = nil
    ) {
        self.target = target
        isSkipped = skipped
        self.parallelizable = parallelizable
        isRandomExecutionOrdering = randomExecutionOrdering
        self.simulatedLocation = simulatedLocation
    }
    
    @available(*, deprecated, message: "Use init with parallelizable: Parallelizable type argument instead")
    public init(
        target: TargetReference,
        skipped: Bool = false,
        parallelizable: Bool = false,
        randomExecutionOrdering: Bool = false,
        simulatedLocation: SimulatedLocation? = nil
    ) {
        self.target = target
        isSkipped = skipped
        self.parallelizable = parallelizable ? .all : .none
        isRandomExecutionOrdering = randomExecutionOrdering
        self.simulatedLocation = simulatedLocation
    }
}

#if DEBUG
    extension TestableTarget {
        public static func test(
            // swiftlint:disable:next force_try
            target: TargetReference = TargetReference(projectPath: try! AbsolutePath(validating: "/Project"), name: "App"),
            skipped: Bool = false,
            parallelizable: Parallelizable = .none,
            randomExecutionOrdering: Bool = false,
            simulatedLocation: SimulatedLocation? = nil
        ) -> TestableTarget {
            TestableTarget(
                target: target,
                skipped: skipped,
                parallelizable: parallelizable,
                randomExecutionOrdering: randomExecutionOrdering,
                simulatedLocation: simulatedLocation
            )
        }
    }
#endif
