//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit

class UIButtonStorySet: StorySet {

    override var name: String {
        return "UIButton"
    }
    
    @objc func snippet_BasicButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "Basic"
        button.configuration = config
        return button
    }

    @objc func snippet_RoundedCornerButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Rounded"
        config.cornerStyle = .medium
        button.configuration = config
        return button
    }

    @objc func snippet_IconButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .leading
        config.imagePadding = 10
        button.configuration = config
        return button
    }

    @objc func snippet_GradientBackgroundButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Gradient"
        config.baseBackgroundColor = .clear
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer.frame = button.bounds
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.configuration = config
        return button
    }

    @objc func snippet_OutlineButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.gray()
        config.title = "Outline"
        config.baseForegroundColor = .blue
        config.buttonSize = .large
        button.configuration = config
        return button
    }

    @objc func snippet_LargeTextButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "Large Text"
        config.attributedTitle?.font = UIFont.systemFont(ofSize: 24)
        button.configuration = config
        return button
    }

    @objc func snippet_BadgeButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Badge"
        config.showsActivityIndicator = true
        button.configuration = config
        return button
    }

    @objc func snippet_ShadowButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.title = "Shadow"
        button.configuration = config
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        return button
    }

    @objc func snippet_ImageTitleButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "Image + Title"
        config.image = UIImage(systemName: "bell")
        config.imagePlacement = .top
        config.titlePadding = 10
        button.configuration = config
        return button
    }
}
