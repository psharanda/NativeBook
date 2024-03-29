//
//  Created by Pavel Sharanda on 03/12/2023.
//

import SwiftUI
import SwiftUIKitView
import UIKit

struct Story {
    let name: String
    let makeView: () -> UIView
}

protocol ComponentStories {
    var componentName: String { get }
    var stories: [Story] { get }
}

class DynamicComponentStories: NSObject, ComponentStories {
    var componentName: String {
        return NSStringFromClass(type(of: self))
            .split(separator: ".").last!
            .replacingOccurrences(of: "Stories", with: "")
    }

    private(set) lazy var stories: [Story] = {
        var methodCount: UInt32 = 0

        guard let methodList = class_copyMethodList(object_getClass(type(of: self)), &methodCount) else { return [] }

        var uniqueSelectors = Set<String>()
        var selectors = [Selector]()
        for i in 0 ..< Int(methodCount) {
            let selector = method_getName(methodList[i])
            let name = NSStringFromSelector(selector)
            if name.starts(with: "story_") {
                if !uniqueSelectors.contains(name) {
                    uniqueSelectors.insert(name)
                    selectors.append(selector)
                }
            }
        }
        free(methodList)

        let cls = type(of: self)
        return selectors.map { selector in
            Story(name: NSStringFromSelector(selector).replacingOccurrences(of: "story_", with: "")) {
                let view = cls.perform(selector).takeUnretainedValue() as! UIView
                view.translatesAutoresizingMaskIntoConstraints = false
                
                // an ugly fix for SwiftUI previews using SwiftUIKitView
                view.heightAnchor.constraint(greaterThanOrEqualToConstant: 0).isActive = true
                return view
            }
        }
    }()
}

extension ComponentStories {
    @ViewBuilder
    var swiftUIPreviews: some View {
        ForEach(stories, id: \.name) { story in
            story.makeView().swiftUIView(layout: .intrinsic)
                .fixedSize()
                .previewLayout(.sizeThatFits)
                .previewDisplayName(story.name)
        }
    }
}
