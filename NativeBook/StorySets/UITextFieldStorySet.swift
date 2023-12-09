//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit

class UITextFieldStorySet: StorySet {
    
    override var name: String {
        return "UITextField"
    }
    
    @objc func story_BasicTextFieldWithPlaceholder() -> UIView {
        let textField = UITextField()
        textField.placeholder = "Placeholder"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .secondarySystemBackground
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return textField
    }
    
    @objc func story_BasicTextFieldWithText() -> UIView {
        let textField = UITextField()
        textField.text = "Text"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .secondarySystemBackground
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return textField
    }
    
    @objc func story_DynamicTypeTextFieldWithPlaceholder() -> UIView {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Placeholder"
        textField.backgroundColor = .secondarySystemBackground
        textField.adjustsFontForContentSizeCategory = true
        textField.font = .preferredFont(forTextStyle: .body)
        textField.adjustsFontForContentSizeCategory = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return textField
    }
    
    @objc func story_DynamicTypeBasicTextFieldWithText() -> UIView {
        let textField = UITextField()
        textField.text = "Text"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .secondarySystemBackground
        textField.adjustsFontForContentSizeCategory = true
        textField.font = .preferredFont(forTextStyle: .body)
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        return textField
    }
}
