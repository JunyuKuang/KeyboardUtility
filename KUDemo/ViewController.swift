//
//  ViewController.swift
//  KUDemo
//
//  Created by Jonny on 9/24/17.
//  Copyright © 2017 Jonny. All rights reserved.
//

import UIKit
import KeyboardUtility

class ViewController: UIViewController {

    private lazy var keyboardLayoutGuide: UILayoutGuide = {
        let guide = KeyboardLayoutGuide()
        view.addLayoutGuide(guide)
        return guide
    }()
    
    /// A text field attached on top of the keyboard.
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.placeholder = "Input something..."
        
        // tap return key to dismiss keyboard
        textField.addTarget(self, action: #selector(editingDidEndOnExit), for: .editingDidEndOnExit)
        
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            view.trailingAnchor.constraint(equalTo: textField.trailingAnchor, constant: 8),
            keyboardLayoutGuide.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 8), // attach on top the keyboard
            ])
        
        return textField
    }()
    
    /// A scroll view for interactive keyboard dismissal.
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        
        scrollView.keyboardDismissMode = .interactive
        scrollView.alwaysBounceVertical = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            ])
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        
        _ = scrollView // for interactive keyboard dismissal.
        _ = textField // will be attached on top of the keyboard.
        setupKeyboardHighlightView() // make keyboard backgroud red.
        
        view.layoutIfNeeded() // force update frames for scroll view and text field based on Auto Layout constraints.
        
        textField.becomeFirstResponder()
    }
    
    private var keyboardFrameObserver: KeyboardFrameObserver?
    
    private func setupKeyboardHighlightView() {
        let frame = CGRect(x: 0, y: view.bounds.height, width: view.bounds.width, height: 0) // setup inital frame to avoid weird animation
        let keyboardHighlightView = UIView(frame: frame)
        
        keyboardHighlightView.backgroundColor = .red
        view.addSubview(keyboardHighlightView)
        
        keyboardFrameObserver = KeyboardFrameObserver(view: view) { [weak keyboardHighlightView] frame, animated in
            keyboardHighlightView?.frame = frame
        }
    }
    
    @objc private func editingDidEndOnExit() {
        print(#function)
    }
}

