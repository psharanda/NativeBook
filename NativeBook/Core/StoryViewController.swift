
//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit
import CoreImage

public class StoryViewController: UIViewController {
    public let storySet: StorySet
    public let selector: Selector
    public init(storySet: StorySet, selector: Selector) {
        self.storySet = storySet
        self.selector = selector
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let result = storySet.perform(selector)
        
        guard let storyView = result?.takeUnretainedValue() as? UIView else {
            return
        }
        
        view.addSubview(storyView)
        
        storyView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            storyView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            storyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            storyView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor),
            storyView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            storyView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
            storyView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
