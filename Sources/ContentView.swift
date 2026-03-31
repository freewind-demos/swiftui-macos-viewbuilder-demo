import SwiftUI

// 使用 @ViewBuilder 创建一个自定义容器
struct ConditionalView<Content: View>: View {
    let condition: Bool
    let content: () -> Content

    init(condition: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.condition = condition
        self.content = content
    }

    var body: some View {
        if condition {
            content()
        }
    }
}

// 使用 @ViewBuilder 创建多视图容器
struct CardSection<Title: View, Content: View>: View {
    let title: () -> Title
    let content: () -> Content

    init(@ViewBuilder title: @escaping () -> Title,
         @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            title()
                .font(.headline)
                .foregroundColor(.blue)

            content()
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct ContentView: View {
    @State private var isLoggedIn = true

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 基础 @ViewBuilder 示例
                ConditionalView(condition: isLoggedIn) {
                    Text("已登录用户")
                        .foregroundColor(.green)
                }

                Button(isLoggedIn ? "退出" : "登录") {
                    isLoggedIn.toggle()
                }

                Divider()

                // CardSection 示例
                CardSection {
                    Text("用户信息")
                } content: {
                    Text("姓名: 张三")
                    Text("邮箱: zhangsan@example.com")
                }

                CardSection {
                    Text("设置")
                } content: {
                    Toggle("深色模式", isOn: .constant(false))
                    Toggle("通知", isOn: .constant(true))
                }

                // ViewBuilder 用于条件视图
                ViewBuilderExample()
            }
            .padding()
        }
    }
}

struct ViewBuilderExample: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("@ViewBuilder 用法")
                .font(.headline)

            // 多个条件视图
            Group {
                if #available(macOS 14.0, *) {
                    Text("macOS 14+ 特性")
                } else {
                    Text("旧版本兼容")
                }
            }
        }
        .padding()
        .background(Color.orange.opacity(0.1))
    }
}
