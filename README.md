# NativeBook
## Intro

Implementing, maintaining, documenting and evolving a shared set of UI components is not an easy thing in a large-scale application. Web developers have created a powerful solution for this process - Storybook.js. But what about native iOS development? Can we achieve a somewhat similar experience?

What if we combine a catalog app, snapshot tests, and HTML-based documentation generation into a single system? 

Imagine writing a code snippet just once, and then being able to do the following:
- Display a view produced from a snippet in a native catalog app
- Embed a view into SwiftUI previews
- Run a snapshot test for a snippet
- Display this code snippet and the resulting snapshot in a generated HTML-based documentation

This repo is a proof of the concept for a such a system!

## Snippet

```swift
class UIButtonStories: DynamicComponentStories {
  @objc static func story_ImageTitleButton() -> UIView {
        let button = UIButton()
        var config = UIButton.Configuration.plain()
        config.title = "Image + Title"
        config.image = UIImage(systemName: "bell")
        config.imagePlacement = .top
        config.titlePadding = 10
        button.configuration = config
        return button
    }
   ...
}
```

## Catalog
<img width="320" src="https://github.com/psharanda/NativeBook/assets/2247256/eb319f5e-7acc-4ae3-ad39-a72225de1c00">

## SwiftUI Preview
<img width="640" src="https://github.com/psharanda/NativeBook/assets/2247256/305c9dd8-1ae7-4a18-a59e-544096ec6352">

## Snapshot tests
<img width="640" src="https://github.com/psharanda/NativeBook/assets/2247256/344ca96c-f85e-43c3-9362-9639cf024035">

## Documentation
<img width="640" src="https://github.com/psharanda/NativeBook/assets/2247256/99b78193-2ae4-4ac1-9228-6851efe50327">
