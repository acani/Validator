import Foundation.NSCharacterSet

public let firstNameRequiredMessage = "First name is required."
public let firstNameTooLongMessage = "First name is too long."
public let lastNameRequiredMessage = "Last name is required."
public let lastNameTooLongMessage = "Last name is too long."
public let invalidUsernameMessage = "Username must be alphanumeric and between 1 & 64 characters."
public let invalidEmailMessage = "Email must contain an at sign (@) and be between 3 & 254 characters."
public let invalidCodeMessage = "Code must be 4 digits."

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
        return 1...3072 ~= count
    }

    public var isValidUsername: Bool {
        return 1...64 ~= count && isAlphanumeric
    }

    public var isValidEmail: Bool {
        return 3...254 ~= count && contains("@")
    }

    public var isValidCode: Bool {
        return count == 6 && isNumeric
    }
}
