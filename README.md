# Validator

Validate name, username, and email

Setup: [How to add a Git repository to your Xcode project][1]

Usage:

```swift
let string = " \n\t abc123  ".strip()  // => "abc123"
string.isAlphanumeric                  // => true
"j_s".isAlphanumeric                   // => false
"0123".isNumeric                       // => true
"1E3".isNumeric                        // => false
```

```swift
let firstName = "John"
let lastName = "Smith"
let username = "johnsmith"
let email = "john.smith@example.com"
let code = "1234"

if !firstName.isValidName {
  print(Validator.invalidFirstNameMessage)
}

if !lastName.isValidName {
  print(Validator.invalidLastNameMessage)
}

if !username.isValidUsername {
  print(Validator.invalidUsernameMessage)
}

if !email.isValidEmail {
  print(Validator.invalidEmailMessage)
}

if !code.isValidCode {
  print(Validator.invalidCodeMessage)
}
```

Released under the [Unlicense][2].


  [1]: https://github.com/acani/Libraries
  [2]: http://unlicense.org
