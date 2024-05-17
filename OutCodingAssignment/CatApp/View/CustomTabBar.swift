//
//  CustomTabBar.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/16/24.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedIndex: Int
    
    let tabs = [
        TabBarItem(icon: "cat-fingerprint", label: "One", content: "HomeView"),
        TabBarItem(icon: "cat-fingerprint-two", label: "Two", content: "SecondView"),
        TabBarItem(icon: "cat-fingerprint-three", label: "Three", content: "ThirdView")
    ]
    
    var body: some View {
        
        ZStack{
            Color.white.edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                Spacer()
                if tabs[selectedIndex].content == "HomeView" {
                    HomeView()
                }else if tabs[selectedIndex].content == "SecondView" {
                    SecondView()
                }else if tabs[selectedIndex].content == "ThirdView" {
                    ThirdView()
                }
            }
            HStack(spacing: 0) {
                ForEach(0..<tabs.count) { index in
                    TabBarButton(tab: tabs[index], isSelected: index == selectedIndex) {
                        selectedIndex = index
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding([.leading, .trailing], 40)
            .frame(height: 90)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: Color.gray.opacity(0.4), radius: 5, x: 0,  y: -2)
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
            
            Image(tab.icon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(isSelected ? Color.red : Color.blue)
            
            Text(tab.label)
                .font(.footnote)
                .foregroundColor(isSelected ? Color.red : Color.blue)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
    
    
}
