//
//  CustomTabBar.swift
//  esimflys
//
//  Created by user258061 on 5/22/24.
//

import Foundation
import SwiftUI

struct CustomTabBar: View {
    @State private var selectedIndex = 0
    
    let tabs = [
        TabBarItem(icon: "fa-cart-shopping", label: "Store", content: "StoreView"),
        TabBarItem(icon: "fa-sim-card", label: "My eSim", content: "MyEsimView"),
        TabBarItem(icon: "fa-book", label: "Instruction", content: "InstructionView"),
        TabBarItem(icon: "fa-account", label: "Account", content: "AccountView")
    ]
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                if tabs[selectedIndex].content == "StoreView" {
                    CatHomeView()
                } else if tabs[selectedIndex].content == "MyEsimView" {
                    
                    EmptyView()
                }else if tabs[selectedIndex].content == "InstructionView" {
                    
                    EmptyView()
                }else if tabs[selectedIndex].content == "AccountView" {
                    
                    EmptyView()
                }
                Spacer()
                HStack(spacing: 0) {
                    ForEach(0..<tabs.count) { index in
                        TabBarButton(tab: tabs[index],
                                     isSelected: index == selectedIndex) {
                            selectedIndex = index
                        }
                                     .frame(maxWidth: .infinity)
                    }
                }
                .padding([.leading, .trailing], 40)
                .frame(height: 90)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(color: Color.gray.opacity(0.4),
                        radius: 5,
                        x: 0,
                        y: -2)
            }
        }
    }
}

struct TabBarItem {
    let icon: String
    let label: String
    let content: String
}

struct TabBarButton: View {
    let tab: TabBarItem
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(tab.icon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(isSelected ? Color.red : Color.black)
                
                Text(tab.label)
                    .font(.footnote)
                    .foregroundColor(isSelected ? Color.red : Color.black)
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
