public struct TestingOptions: Sendable, OptionSet, Codable, Hashable {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let randomExecutionOrdering = TestingOptions(rawValue: 1 << 1)
    public static let parallelizable = TestingOptions(rawValue: 1 << 0)
    public static let parallelizableSwiftTestingOnly = TestingOptions(rawValue: 1 << 2)

    public static func parallelizationOption(_ value: Int) -> TestingOptions {
        switch value {
        case 0:
            return []
        case 1:
            return .parallelizable
        case 2:
            return .parallelizableSwiftTestingOnly
        default:
            return []
        }
    }
}
