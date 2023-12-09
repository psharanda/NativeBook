//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit

class UIButtonStorySet: StorySet {

    override var name: String {
        return "UIButton"
    }
    
    @objc func story_BasicButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "Basic"
        button.configuration = config
        return button
    }

    @objc func story_RoundedCornerButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Rounded"
        config.cornerStyle = .medium
        button.configuration = config
        return button
    }
    
    @objc func story_LightDarkRoundedCornerButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        config.title = "Rounded"
        config.baseBackgroundColor = .tertiarySystemBackground
        config.baseForegroundColor = .label
        config.cornerStyle = .medium
        button.configuration = config
        return button
    }

    @objc func story_IconButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.tinted()
        config.image = UIImage(systemName: "star")
        config.imagePlacement = .leading
        config.imagePadding = 10
        button.configuration = config
        return button
    }

    @objc func story_OutlineButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.gray()
        config.title = "Outline"
        config.baseForegroundColor = .blue
        config.buttonSize = .large
        button.configuration = config
        return button
    }

    @objc func story_ImageTitleButton() -> UIView {
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
