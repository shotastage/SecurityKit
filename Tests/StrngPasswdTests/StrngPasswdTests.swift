import XCTest
@testable import StrngPasswd

final class StrngPasswdTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(String(StrngPasswd(passwd: "H839HsW@").evaluatePasswd), "H839HsW@")
    }
}
