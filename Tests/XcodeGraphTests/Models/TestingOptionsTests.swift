import Foundation
import Path
@testable import XcodeGraph
import XCTest

final class TestingOptionsTests: XCTestCase {
    func test_parallelizationOption_zero_returns_nil() {
        // Given
        let subject = TestingOptions.parallelizationOption(0)
            
        // Then
        XCTAssert(subject == [])
    }
    
    func test_parallelizationOption_one_returns_parallelizable() {
        // Given
        let subject = TestingOptions.parallelizationOption(1)
            
        // Then
        XCTAssert(subject == .parallelizable)
    }
    
    func test_parallelizationOption_two_returns_swift_testing_only() {
        // Given
        let subject = TestingOptions.parallelizationOption(2)
            
        // Then
        XCTAssert(subject == .parallelizableSwiftTestingOnly)
    }
}
