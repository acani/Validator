import XCTest
import Validator

class ValidatorTests: XCTestCase {
  func testFirstNameRequiredMessage() {
    XCTAssertEqual(firstNameRequiredMessage, "First name is required.")
  }

  func testFirstNameTooLongMessage() {
    XCTAssertEqual(firstNameTooLongMessage, "First name is too long.")
  }

  func testLastNameRequiredMessage() {
    XCTAssertEqual(lastNameRequiredMessage, "Last name is required.")
  }

  func testLastNameTooLongMessage() {
    XCTAssertEqual(lastNameTooLongMessage, "Last name is too long.")
  }

  func testInvalidUsernameMessage() {
    let expected = "Username must be alphanumeric and between 1 & 64 characters."
    XCTAssertEqual(invalidUsernameMessage, expected)
  }

  func testInvalidEmailMessage() {
    let expected = "Email must contain an at sign (@) and be between 3 & 254 characters."
    XCTAssertEqual(invalidEmailMessage, expected)
  }

  func testInvalidCodeMessage() {
    XCTAssertEqual(invalidCodeMessage, "Code must be 6 digits.")
  }

  func testStrip() {
    XCTAssertEqual("".strip(), "")                     // empty
    XCTAssertEqual("—Cool-".strip(), "—Cool-")         // dashes
    XCTAssertEqual("  cool  ".strip(), "cool")         // spaces
    XCTAssertEqual("\n cool \t".strip(), "cool")       // other
    XCTAssertEqual("cool yo".strip(), "cool yo")       // normal
  }

  func testIsAlphanumeric() {
    XCTAssertFalse("".isAlphanumeric)                  // empty
    XCTAssertFalse("Hello World".isAlphanumeric)       // space
    XCTAssertFalse("7à123".isAlphanumeric)             // diacritic
    XCTAssertFalse("mc²".isAlphanumeric)               // superscript
    XCTAssertTrue("abc123".isAlphanumeric)             // normal
    XCTAssertTrue("abcdefghijklmNOPQRSTUVWXYZ01234".isAlphanumeric)
    XCTAssertTrue("ABCDEFGHIJKLMnopqrstuvwxyz56789".isAlphanumeric)
  }

  func testIsNumeric() {
    XCTAssertFalse("".isNumeric)                       // empty
    XCTAssertFalse("12E3".isNumeric)                   // not numeric
    XCTAssertFalse("23²3".isNumeric)                   // superscript
    XCTAssertTrue("002".isNumeric)                     // zero first
    XCTAssertTrue("1234".isNumeric)                    // normal
  }

  func testIsValidName() {
    var longName = """
    abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.0123456789 \
    `~!@#$%^&*()_—+={}[]\\|\"'?/<>,;:—
    """
    longName = String(repeating: longName, count: 32)
    XCTAssertEqual(longName.count, 3072)

    XCTAssertFalse("".isValidName)                     // empty / too short
    XCTAssertFalse((longName+"1").isValidName)         // too long
    XCTAssertTrue("a".isValidName)                     // shortest
    XCTAssertTrue("1".isValidName)
    XCTAssertTrue(longName.isValidName)                // longest
    XCTAssertTrue("John".isValidName)                  // normal
  }

  func testIsValidUsername() {
    let longUsername = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ12"
    XCTAssertEqual(longUsername.count, 64)

    XCTAssertFalse("".isValidUsername)                 // too short
    XCTAssertFalse((longUsername+"3").isValidUsername) // too long
    XCTAssertFalse("John Smith".isValidUsername)       // not alphanumeric
    XCTAssertFalse("John.Smith".isValidUsername)
    XCTAssertTrue("a".isValidUsername)                 // shortest
    XCTAssertTrue("1".isValidUsername)
    XCTAssertTrue(longUsername.isValidUsername)        // longest
    XCTAssertTrue("abc123".isValidUsername)            // letters & numbers
    XCTAssertTrue("johnsmith".isValidUsername)         // only letters
    XCTAssertTrue("1234567890".isValidUsername)        // only numbers
  }

  func testIsValidEmail() {
    var longEmail  = "max@"; for _ in 1...250 { longEmail += "x" }
    XCTAssertEqual(longEmail.count, 254)

    XCTAssertFalse("".isValidEmail)                    // empty
    XCTAssertFalse("a@".isValidEmail)                  // too short
    XCTAssertFalse((longEmail+"1").isValidEmail)       // too long
    XCTAssertFalse("no at-sign".isValidEmail)          // no at-sign
    XCTAssertTrue("a2@".isValidEmail)                  // shortest
    XCTAssertTrue(longEmail.isValidEmail)              // longest
    XCTAssertTrue("me@example.com".isValidEmail)       // normal
  }

  func testIsValidCode() {
    XCTAssertFalse("".isValidCode)                     // empty
    XCTAssertFalse("00221".isValidCode)                // too short
    XCTAssertFalse("1232386".isValidCode)              // too long
    XCTAssertFalse("23356²".isValidCode)               // superscript
    XCTAssertFalse("1290E3".isValidCode)               // not numeric
    XCTAssertTrue("123456".isValidCode)                // normal
  }
}
