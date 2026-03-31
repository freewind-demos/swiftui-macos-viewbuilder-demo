# SwiftUI macOS @ViewBuilder

## 简介

演示 SwiftUI 中 `@ViewBuilder` 的用法，用于创建可以接受多个子视图的 DSL。

## 快速开始

```bash
cd swiftui-macos-viewbuilder-demo
xcodegen generate
open SwiftUIViewBuilderDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### @ViewBuilder 基础

```swift
struct MyContainer<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
    }
}
```

### 使用

```swift
MyContainer {
    Text("Hello")
    Text("World")
}
```

## 完整示例

```swift
struct Card<Content: View>: View {
    let content: () -> Content

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        content()
            .padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(8)
    }
}

// 使用
Card {
    Text("标题")
    Text("内容")
}
```
