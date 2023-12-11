//
//  Created by Pavel Sharanda on 02/12/2023.
//

import iOSSnapshotTestCase
@testable import NativeBook
import XCTest

class NativeBookSnapshotTestCase: FBSnapshotTestCase {
    override func setUp() {
        super.setUp()
        usesDrawViewHierarchyInRect = true
    }

    func runTests(for componentStories: ComponentStories) {
        for story in componentStories.stories {
            if let view = story.makeView() {
                NativeBookVerifyView(view, storyName: story.name)
            }
        }
    }

    private func NativeBookVerifyView(_ view: UIView, storyName: String) {
        let window = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }.last!
        window.addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: window.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: window.centerYAnchor),
        ])

        let contentSizeCategories: [UIContentSizeCategory: String] = [
            .extraSmall: "xs",
            .medium: "m",
            .large: "default",
            .extraLarge: "xl",
            .extraExtraExtraLarge: "xxxl",
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

final class UILabelTests: NativeBookSnapshotTestCase {
    func test() {
        // recordMode = true
        runTests(for: UILabelStories())
    }
}

final class UIButtonTests: NativeBookSnapshotTestCase {
    func test() {
        // recordMode = true
        runTests(for: UIButtonStories())
    }
}

final class UITextFieldTests: NativeBookSnapshotTestCase {
    func test() {
        // recordMode = true
        runTests(for: UITextFieldStories())
    }
}
