# Validator

Validate name, username, and email

Setup: [How to add a Git repository to your Xcode project][1]

Usage:

```swift
let firstName = "John"
let lastName = "Smith"
let email = "john.smith@example.com"
let username = "johnsmith"

if !firstName.isValidName {
    print(Validator.invalidFirstNameMessage)
}

if !lastName.isValidName {
    print(Validator.invalidLastNameMessage)
}

if !email.isValidEmail {
    print(Validator.invalidEmailMessage)
}

if !username.isValidUsername {
    print(Validator.invalidUsernameMessage)
}
```

```swift
let string = " \n\t abc123  ".strip()  // => "cool"
string.isAlphanumeric                  // => false
"abc123".isAlphanumeric                // => true
```

Released under the [Unlicense][2].


  [1]: https://github.com/acani/Libraries
  [2]: http://unlicense.org
