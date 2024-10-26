import Foundation

public enum Parallelizable: Hashable, Codable, Sendable {
    case all
    case swiftTestingOnly
    case none
}
