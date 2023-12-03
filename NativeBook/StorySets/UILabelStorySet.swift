//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit

class UILabelStorySet: StorySet {
    
    override var name: String {
        return "UILabel"
    }
    
    @objc func snippet_Primary() -> UIView {
        let label = UILabel()
        label.text = "Primary"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .systemBackground
        
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return label
    }
    
    @objc func snippet_Secondary() -> UIView {
        let label = UILabel()
        label.text = "Secondary"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .systemBackground
        
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        return label
    }
}
