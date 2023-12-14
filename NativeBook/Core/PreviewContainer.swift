// from https://sarunw.com/posts/xcode-previews-with-uiview/

import SwiftUI

struct PreviewContainer<T: UIView>: UIViewRepresentable {
    let view: T
    init(_ viewBuilder: @escaping () -> T) {
        view = viewBuilder()
    }

    func makeUIView(context _: Context) -> T {
        return view
    }

    func updateUIView(_ view: T, context _: Context) {
        view.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        view.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }
}
