//
//  NativeBookTests.swift
//  NativeBookTests
//
//  Created by Pavel Sharanda on 02/12/2023.
//

import XCTest
import iOSSnapshotTestCase
@testable import NativeBook


public extension FBSnapshotTestCase {
    
    func NativeBookVerifyView(_ view: UIView, suffixes: NSOrderedSet = FBSnapshotTestCaseDefaultSuffixes(), perPixelTolerance: CGFloat = 0, overallTolerance: CGFloat = 0, file: StaticString = #file, line: UInt = #line) {
        
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
            FBSnapshotVerifyView(view, identifier: categoryName, suffixes: suffixes, perPixelTolerance: perPixelTolerance, overallTolerance: overallTolerance, file: file, line: line)
        }
        
        view.traitOverrides.preferredContentSizeCategory = .large
        
        view.traitOverrides.userInterfaceStyle = .dark
        window.layoutIfNeeded()
        FBSnapshotVerifyView(view, identifier: "dark", suffixes: suffixes, perPixelTolerance: perPixelTolerance, overallTolerance: overallTolerance, file: file, line: line)
        
        
        view.traitOverrides.layoutDirection = .rightToLeft
        view.semanticContentAttribute = .forceRightToLeft
        view.traitOverrides.userInterfaceStyle = .light
        window.layoutIfNeeded()
        FBSnapshotVerifyView(view, identifier: "rtl", suffixes: suffixes, perPixelTolerance: perPixelTolerance, overallTolerance: overallTolerance, file: file, line: line)

    }
}


final class NativeBook_UIButton_Tests: FBSnapshotTestCase {

    override func setUp() {
        super.setUp()
        usesDrawViewHierarchyInRect = true
        recordMode = true
    }

    func test_primary() {
        let label = UILabel()
        label.text = "Hello World"
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = .systemBackground
        
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        NativeBookVerifyView(label)
    }
}

