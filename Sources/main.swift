import Cocoa

@main
struct ViewBuilderApp: App {
    var body: some Scene {
        Window("@ViewBuilder", id: "main") {
            ContentView()
        }
        .defaultSize(width: 500, height: 500)
    }
}
