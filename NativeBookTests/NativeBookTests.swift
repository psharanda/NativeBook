//
//  NativeBookTests.swift
//  NativeBookTests
//
//  Created by Pavel Sharanda on 02/12/2023.
//

import XCTest
import iOSSnapshotTestCase
@testable import NativeBook


class NativeBookSnapshotTestCase: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        usesDrawViewHierarchyInRect = true
    }
    
    func runSnippetTests(for storySet: StorySet) {
        let snippetSelectors = storySet.snippetSelectors
        for selector in snippetSelectors {
            let result = storySet.perform(selector)
            if let view = result?.takeUnretainedValue() as? UIView {
                NativeBookVerifyView(view, storyName: NSStringFromSelector(selector))
            }
        }
    }
    
    private func NativeBookVerifyView(_ view: UIView, storyName: String) {
        
        let window = UIApplication
            .shared
            .connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last!
        window.addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            view.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: window.centerYAnchor),
            view.topAnchor.constraint(greaterThanOrEqualTo: window.topAnchor),
            view.bottomAnchor.constraint(lessThanOrEqualTo: window.bottomAnchor),
            view.leadingAnchor.constraint(greaterThanOrEqualTo: window.leadingAnchor),
            view.trailingAnchor.constraint(lessThanOrEqualTo: window.trailingAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        let contentSizeCategories: [UIContentSizeCategory: String] = [
            .extraSmall: "xs",
            .medium: "m",
            .large: "default",
            .extraLarge: "xl",
            .extraExtraExtraLarge: "xxxl"
        ]
        
        for (category, categoryName) in contentSizeCategories {
            view.traitOverrides.preferredContentSizeCategory = category
            window.layoutIfNeeded()
            FBSnapshotVerifyView(view, identifier: storyName + "__" + categoryName)
        }
        
        view.traitOverrides.preferredContentSizeCategory = .large
        
        view.traitOverrides.userInterfaceStyle = .dark
        window.layoutIfNeeded()
        FBSnapshotVerifyView(view, identifier: storyName + "__dark")
        
        
        view.traitOverrides.layoutDirection = .rightToLeft
        view.semanticContentAttribute = .forceRightToLeft
        view.traitOverrides.userInterfaceStyle = .light
        window.layoutIfNeeded()
        FBSnapshotVerifyView(view, identifier: storyName + "__rtl")

        view.removeFromSuperview()
    }
}

final class UILabel_Tests: NativeBookSnapshotTestCase {
    func test() {
        //recordMode = true
        runSnippetTests(for: UILabelStorySet())
    }
}

final class UIButton_Tests: NativeBookSnapshotTestCase {
    func test() {
        //recordMode = true
        runSnippetTests(for: UIButtonStorySet())
    }
}

