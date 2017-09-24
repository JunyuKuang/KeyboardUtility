# KeyboardUtility
iOS keyboard frame real-time tracking.

See demo video on YouTube:
https://youtu.be/w3BKTFrxs4I

# Requirement
- Xcode 9.0
- Swift 4.0
- iOS 8.0+ for manual keyboard frame observation
- iOS 9.0+ for auto keyboard frame observation with UILayoutGuide

# Usage

Auto keyboard frame observation with `UILayoutGuide`:
``` swift
let keyboardLayoutGuide = KeyboardLayoutGuide()
view.addLayoutGuide(keyboardLayoutGuide)

// place a text field on top of the keyboard using auto layout
let textField = UITextField()
textField.borderStyle = .roundedRect
view.addSubview(textField)

textField.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
    view.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
    keyboardLayoutGuide.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8),
])
```

# License
MIT.
