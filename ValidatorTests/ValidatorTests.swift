import XCTest
import Validator

class ValidatorTests: XCTestCase {
    func testInvalidEmailMessage() {
        XCTAssertEqual(invalidEmailMessage, "Email must contain an at sign (@) and be between 3 & 254 characters.")
    }

    func testInvalidFirstNameMessage() {
        XCTAssertEqual(invalidFirstNameMessage, "First name must be between 1 & 50 characters.")
    }

    func testInvalidLastNameMessage() {
        XCTAssertEqual(invalidLastNameMessage, "Last name must be between 1 & 50 characters.")
    }

    func testIsAlphanumeric() {
        XCTAssertFalse("".isAlphanumeric)                   // empty
        XCTAssertFalse("Hello World".isAlphanumeric)        // space
        XCTAssertFalse("7à123".isAlphanumeric)              // diacritic
        XCTAssertFalse("mc²".isAlphanumeric)                // superscript
        XCTAssertTrue("abc123".isAlphanumeric)              // normal
        XCTAssertTrue("abcdefghijklmNOPQRSTUVWXYZ01234".isAlphanumeric)
        XCTAssertTrue("ABCDEFGHIJKLMnopqrstuvwxyz56789".isAlphanumeric)
    }

    func testIsValidEmail() {
        var longEmail  = "max@"; for _ in 1...250 { longEmail += "x" }
        XCTAssertEqual(longEmail.characters.count, 254)

        XCTAssertFalse("".isValidEmail)                     // empty
        XCTAssertFalse("a@".isValidEmail)                   // too short
        XCTAssertFalse((longEmail+"1").isValidEmail)        // too long
        XCTAssertFalse("no at-sign".isValidEmail)           // no at-sign
        XCTAssertTrue("a2@".isValidEmail)                   // shortest
        XCTAssertTrue(longEmail.isValidEmail)               // longest
        XCTAssertTrue("me@example.com".isValidEmail)        // normal
    }

    func testIsValidName() {
        let longName = "abcdefghijklmnopqrstuvwxyz 0123456789`~!@#$%^&*)_—"
        XCTAssertEqual(longName.characters.count, 50)

        XCTAssertFalse("".isValidName)                      // empty / too short
        XCTAssertFalse((longName+"1").isValidName)          // too long
        XCTAssertTrue("j".isValidName)                      // shortest
        XCTAssertTrue(longName.isValidName)                 // longest
        XCTAssertTrue("John".isValidName)                   // normal
    }

    func testIsValidUsername() {
        let longUsername = "0123456789abcde"
        XCTAssertEqual(longUsername.characters.count, 15)

        XCTAssertFalse("".isValidUsername)                  // empty
        XCTAssertFalse("john".isValidUsername)              // too short
        XCTAssertFalse((longUsername+"f").isValidUsername)  // too long
        XCTAssertFalse("John Smith".isValidUsername)        // not alphanumeric
        XCTAssertTrue("JohnS".isValidUsername)              // shortest
        XCTAssertTrue(longUsername.isValidUsername)         // longest
        XCTAssertTrue("johnsmith".isValidUsername)          // normal
    }

    func testStrip() {
        XCTAssertEqual("".strip(), "")                      // empty
        XCTAssertEqual("—Cool-".strip(), "—Cool-")          // dashes
        XCTAssertEqual("  cool  ".strip(), "cool")          // spaces
        XCTAssertEqual("\n cool \t".strip(), "cool")        // other
        XCTAssertEqual("cool yo".strip(), "cool yo")        // normal
    }
}
