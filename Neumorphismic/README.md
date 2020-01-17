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
- iOS 13 or tvOS 13 or macOS 10.15 or watchOS or later
- Swift 5.1

## Installation

### Swift Package Manager

Open your Xcode project, select `File` -> `Swift Packages` -> `Add Package Dependency...`. and type this depository's URL.

## How to use

### Simple way

```swift
struct ContentView: View {
    
    let baseColor = Color(hex: "C1D2EB")
    
    var body: some View {
        ZStack {
            baseColor
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .fill(baseColor)
                .frame(width: 300, height: 200)
                .modifier(NMConvexModifier())
                .environment(\.nmBaseColor, baseColor)
        }
    }
}
```

If you want modify `NMConvexModifier` to components using `Binding`, you must modify to it's background view.

```swift
TextField("C1D2EB", text: $model.userInput)
    .foregroundColor(baseColor.nmPrimary(1))
    .padding(5)
    .background(
        RoundedRectangle(cornerRadius: 5, style: .continuous)
            .fill(baseColor)
            .modifier(NMConvexModifier(radius: 9))
    )
```

And when you modify to other components, you should modify too because for performance. There is detail of usage in `Demo_iOS`.   

### FloatingTabView

Neumorphismic contains `FloatingTabView`.

```swift
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

struct ContentView: View {
    
    @State var selection: Tab = .demo
    
    var body: some View {
        NMFloatingTabView(
            selection: $selection,
            verticalPadding: 34,
            horizontalPadding: UIDevice.current.hasRoundedDisplay ? 0 : 34,
            labelText: { tab in tab.rawValue },
            labelImage: { tab in tab.image() }
        ) { tab in
            tab.view()
        }
        .environment(\.nmBaseColor, Color(hex: "C1D2EB"))
    }
}

```

