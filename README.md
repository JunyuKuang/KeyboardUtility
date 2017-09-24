# KeyboardUtility
iOS keyboard frame real-time tracking.

See demo video on YouTube:
https://youtu.be/w3BKTFrxs4I

# Requirement
- Xcode 9.0
- Swift 4.0
- iOS 9.0+ for auto keyboard frame observation with `UILayoutGuide`
- iOS 8.0+ for manual keyboard frame observation

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

Manual keyboard frame observation:
``` swift
// Strong reference the observer to make sure keyboard frame keep update to date.
// Will stop observation automatically when deinit.
var keyboardFrameObserver: KeyboardFrameObserver?

/// make keyboard backgroud red.
func setupKeyboardHighlightView() {
    let frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 0) // setup inital frame to avoid weird animation
    let keyboardHighlightView = UIView(frame: frame)
    
    keyboardHighlightView.backgroundColor = .red
    view.addSubview(keyboardHighlightView)
    
    keyboardFrameObserver = KeyboardFrameObserver(view: view) { [weak keyboardHighlightView] frame, animated in
        // the frame is related to view
        keyboardHighlightView?.frame = frame
    }
}
```

# Installation
1. Download KeyboardUtility
2. Create a new **Swift Cocoa Touch Framework** in your project and name it KeyboardUtility
3. Drag 3 files **KeyboardFrameObserver.swift**, **KeyboardFrameObserversManager.swift**, **KeyboardLayoutGuide.swift** from KeyboardUtility into the new KeyboardUtility folder that Xcode create for you
4. Add the new framework as your other target's **Linked Frameworks and Libraries**
5. `import KeyboardUtility`

# Apps use KeyboardUtility

### Aurora Dictionary 极光词典
An elegant English-Chinese Chinese-English dictionary

[App Store](https://itunes.apple.com/app/id1154746981?at=1001lmw6)
  
  
### MessageFilter 短信过滤
Block and filter spam SMS messages for iOS 11

[App Store](https://itunes.apple.com/app/id1262898709?at=1001lmw6)


# License - MIT
Copyright (c) 2017 Junyu Kuang

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
