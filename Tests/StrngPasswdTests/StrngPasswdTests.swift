import XCTest
@testable import StrngPasswd

final class StrngPasswdTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(String(StrngPasswd(passwd: "H839HsW@").evaluatePasswd), "H839HsW@")
    }

    func testStrongPasswd() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let superWeakPasswd1 = "@@Passwd123"

        let conditions = [
            CheckCondition.containNumericCharactors,
            CheckCondition.containUppercaseAlphabet,
            CheckCondition.containLowercaseAlphabet,
            CheckCondition.containNumericMinimum(8)
        ]

        XCTAssertEqual(StrngPasswd(passwd: superWeakPasswd1).validate(conditions: conditions), [])
    }

    func testWeakPasswd() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        
        let superWeakPasswd1 = "qwerty"

        let conditions = [
            CheckCondition.containNumericCharactors,
            CheckCondition.containUppercaseAlphabet,
            CheckCondition.containLowercaseAlphabet,
            CheckCondition.containNumericMinimum(8)
        ]

        XCTAssertEqual(StrngPasswd(passwd: superWeakPasswd1).validate(conditions: conditions), [
            InvalidCondition.numericCharactorNotContained,
            InvalidCondition.uppercaseNotContained,
            InvalidCondition.notEnoughCharacters
        ])
    }
}
