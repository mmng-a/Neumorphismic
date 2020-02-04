//
//  NMFloatingTabView.swift
//  Neumorphismic
//
//  Created by Masashi Aso on 2020/01/14.
//  Copyright © 2020 Masashi Aso. All rights reserved.
//
#if canImport(SwiftUI)
import SwiftUI

#if os(iOS)
@available(iOS 13, *)
public struct NMFloatingTabView<Item, Content>: View
    where Item: CaseIterable & Hashable, Content: View {
    
    @Environment(\.nmBaseColor) private var baseColor: Color
    
    @Binding private var selection: Item
    private let text: (Item) -> String?
    private let image: (Item) -> Image
    private let content: (Item) -> Content
    
    private let verticalPadding: CGFloat
    private let horizontalPadding: CGFloat
    
    /// Neumorphismic Floating Tab
    /// it allow 4 tabs.
    /// - Parameters:
    ///   - selection: Bind to selection enum
    ///   - verticalPadding: Left and right padding. 
    ///   - horizontalPadding: Default is `0`, it's good for devices that has rounded display. But for iPhone 8, iPad Air...etc, You should set a value as `verticalPadding`
    ///   - labelText: Tab's description. If it's `nil`, `labelImage` will show center of tab.
    ///   - labelImage: Tab's image.
    ///   - content: Tab's content view.
    public init(
        selection: Binding<Item>,
        verticalPadding: CGFloat = 34,
        horizontalPadding: CGFloat = 0,
        labelText: @escaping (Item) -> String?,
        labelImage: @escaping (Item) -> Image,
        content: @escaping (Item) -> Content
    ) {
        self._selection = selection
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
        self.text = labelText
        self.image = labelImage
        self.content = content
    }
    
    public var body: some View {
        ZStack {
            baseColor.edgesIgnoringSafeArea(.all)
            content(selection)
            VStack {
                Spacer()
                tab(items: Array(Item.allCases.prefix(4)))
                    .frame(height: 60)
                Spacer().frame(height: self.horizontalPadding)
            }
        }
    }
    
    private func tab(items: [Item]) -> some View {
        GeometryReader { g in
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                ForEach(items, id: \.self) { item in
                    self.tabItem(item)
                    .frame(width: (g.size.width - self.verticalPadding*2 - 20) / CGFloat(items.count),
                           height: g.size.height)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selection = item
                    }
                }
            }
            .frame(width: g.size.width - self.verticalPadding*2,
                   height: g.size.height)
            .background(
                RoundedRectangle(cornerRadius: g.size.height / 2)
                    .foregroundColor(self.baseColor)
                    .modifier(NMConvexModifier())
            )
        }
    }
    
    private func tabItem(_ item: Item) -> some View {
        VStack {
            if text(item) != nil {
                Spacer().frame(height: 10)
            }
            image(item).imageScale(.large)
            if text(item) != nil {
                Spacer().frame(height: 10)
                Text(text(item)!)
                    .font(.caption)
                    .lineLimit(1)
            }
        }
        .foregroundColor(self.baseColor.primary(
            self.selection == item ? 0.5 : 0.2
        ))
    }
}

@available(iOS 13, *)
internal struct FloatingTabView_ForPreviews: View {
    enum Season: String, CaseIterable {
        case spring, summer, fall, winter
        var color: Color {
            switch self {
            case .spring: return .pink
            case .summer: return .blue
            case .fall:   return .orange
            case .winter: return .white
            }
        }
    }
    @State var season: Season = .spring
    var body: some View {
        NMFloatingTabView(selection: $season, labelText: { s in
            s.rawValue
        }, labelImage: { _ in Image(systemName: "camera") }) { s in
            s.color.edgesIgnoringSafeArea(.all)
        }
    }
}

@available(iOS 13, *)
internal struct FloatingTabView_Previews: PreviewProvider {
    static var previews: some View {
        FloatingTabView_ForPreviews()
    }
}

#endif
#endif
