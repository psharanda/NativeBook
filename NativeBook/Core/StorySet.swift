//
//  StorySet.swift
//  NativeBook
//
//  Created by Pavel Sharanda on 03/12/2023.
//

import UIKit


public class StorySet: NSObject {
    
    public var name: String {
        return NSStringFromClass(type(of: self)).replacingOccurrences(of: "StorySet", with: "")
    }
    
    private var _cachedStories: [Selector]?
    
    public var stories: [Selector] {
        let result = _cachedStories ?? getStorySelectors()
        _cachedStories = result
        return result
    }
    
    private func getStorySelectors() -> [Selector] {
        var methodCount: UInt32 = 0
        
        guard let methodList = class_copyMethodList(type(of: self), &methodCount) else { return [] }

        var selectors = [Selector]()
        for i in 0..<Int(methodCount) {
            let selector = method_getName(methodList[i])
            let name = NSStringFromSelector(selector)
            if name.starts(with: "story_") {
                selectors.append(selector)
            }
        }
        free(methodList)

        return selectors
    }
}


