//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit

class UILabelStories: DynamicComponentStories {
    @objc static func story_BasicLabel() -> UIView {
        let label = UILabel()
        label.text = "Hello World"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .systemBackground

        return label
    }

    @objc static func story_FixedWidthLabel() -> UIView {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .systemBackground

        label.widthAnchor.constraint(equalToConstant: 120).isActive = true

        return label
    }
}
