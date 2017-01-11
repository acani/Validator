import Foundation.NSCharacterSet

private let invalidNameMessage      = " name must be between 1 & 3,072 characters."
public  let invalidFirstNameMessage = "First" + invalidNameMessage
public  let invalidLastNameMessage  = "Last" + invalidNameMessage
public  let invalidUsernameMessage  = "Username must be alphanumeric and between 1 & 64 characters."
public  let invalidEmailMessage     = "Email must contain an at sign (@) and be between 3 & 254 characters."
public  let invalidCodeMessage      = "Code must be 4 digits."

extension String {
    public func strip() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }

    public var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }

    public var isNumeric: Bool {
        return !isEmpty && range(of: "[^0-9]", options: .regularExpression) == nil
    }

    public var isValidName: Bool {
        return 1...3072 ~= characters.count
    }

    public var isValidUsername: Bool {
        return 1...64 ~= characters.count && isAlphanumeric
    }

    public var isValidEmail: Bool {
        return 3...254 ~= characters.count && characters.contains("@")
    }

    public var isValidCode: Bool {
        return characters.count == 4 && isNumeric
    }
}
