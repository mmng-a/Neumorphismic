![](https://img.shields.io/github/license/mcasashi-aso/Neumorphismic)
![](https://img.shields.io/badge/Swift-5.1-brightgreen)
![](https://img.shields.io/badge/SwiftPM-complete-blue)
![](https://img.shields.io/badge/license-MIT-yellow)



# Neumorphismic

Neumorphism is next design theory. 
This library make easy to made SwiftUI app with Neumorphism.

<img width="375" alt="Demo view" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/186526/da601bf5-0387-9c0d-0e2a-de6cc5e1e38f.png">
<img width="375" alt="Settings view" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/186526/9b5782fc-9f20-53f5-ac8c-9d4c7049e9b5.png">

## Requirements

- Xcode 11.0 or later
- iOS 13 or tvOS 13 or macOS 10.15 or watchOS 6.0 or later
- Swift 5.1

## Installation

### Swift Package Manager

Open your Xcode project, select `File` -> `Swift Packages` -> `Add Package Dependency...`. and type this depository's URL.

## How to use

### Simple way

```swift:SceneDelegate.swift
let contentView = ContentView()
    .environment(\.nmBaseColor, Color(hex: "C1D2EB")
```


```swift:ContentView.swift
struct ContentView: View {

    @Environment(\.nmBaseColor) var baseColor: Color
    
    var body: some View {
        ZStack {
            baseColor
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(baseColor)
                .frame(width: 300, height: 200)
                .modifier(NMConvexModifier())
        }
    }
}
```
There is detail of usage in `Demo_iOS`.   

### FloatingTabView

You can use Neumorphismic TabView.

```swift:Tab.swift
enum Tab: String, Hashable, CaseIterable {
    
    case demo = "Demo"
    case settings = "Settings"
    
    func image() -> Image {
        switch self {
        case .demo:     return Image(systemName: "house")
        case .settings: return Image(systemName: "gear")
        }
    }
    
    func view() -> some View {
        VStack {
            if self == .demo {
                DemosView()
            } else {
                SettingsView()
            }
        }
    }
}
```
```swift:ContentView.swift
struct ContentView: View {
    
    @State var selection: Tab = .demo
    
    var body: some View {
        NMFloatingTabView(
            selection: $selection,
            labelText: { tab in tab.rawValue },
            labelImage: { tab in tab.image() }
        ) { tab in
            tab.view()
        }
        .environment(\.nmBaseColor, Color(hex: "C1D2EB"))
    }
}
```

### HighlightableButton

If you want to change appearance when button highlighted, you can use it.

```swift:ContentView.swift
struct ContentView: View {
    @State var isSelected = false
    var body: some View {
        NMHighlightableButton(action: {
            self.isSelected.toggle()
        }) { isH in
            Image(systemName: self.isSelected ? "house.fill" : "house")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.blue)
                .opacity(isH ? 0.6 : 1)
                .frame(width: isH ? 80 : 100,
                       height: isH ? 80 : 100)
        }
    }
}
```

