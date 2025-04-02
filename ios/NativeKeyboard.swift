import Foundation
import React
import UIKit

@objc(NativeKeyboardManager)
class NativeKeyboardManager: RCTViewManager {
    override func view() -> UIView! {
        return NativeKeyboardView()
    }

    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}

class NativeKeyboardView: UIView, UITextFieldDelegate {
    private var textField: UITextField!
    @objc var onTextChange: RCTBubblingEventBlock?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTextField()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTextField() {
        textField = UITextField(frame: self.bounds)
        textField.placeholder = "Enter text..."
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.delegate = self
        textField.autocorrectionType = .no
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.becomeFirstResponder() // Open the keyboard immediately
        addSubview(textField)
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let onTextChange = onTextChange {
            onTextChange(["text": textField.text ?? ""])
        }
    }
}
