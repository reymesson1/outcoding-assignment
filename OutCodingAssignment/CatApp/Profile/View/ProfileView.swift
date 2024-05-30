//
//  ProfileView.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/30/24.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var isExpanded = false
    @State private var selectedLanguage = "English"
    
    let languages = ["English", "Spanish", "German", "French", "Italian", "Portuguese"]
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            Image("fa-cat-head")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            
            VStack{
                Button(action: {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }, label: {
                    VStack(alignment: .leading){
                        HStack {
                            VStack(alignment: .leading, spacing: 2){
                                Text("Change the language")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.orange)
                                Text(selectedLanguage)
                                    .font(.system(size: 16, weight: .regular))
                                    .foregroundColor( Color.black)
                                    .autocapitalization(.none)
                            }
                            .padding(.leading, 10)
                            Spacer()
                            Image("arrow_chevron_sourth")
                                .padding()
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60, alignment: .center)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                })
                
                if isExpanded {
                    
                    ScrollView{
                        
                        SingleSelectionList(recibedItems: languages, selected: $selectedLanguage )
                            .frame(height: 200)
                            .buttonStyle(.plain)
                            .onChange(of: selectedLanguage) { newValue in
                                if newValue == "English" {
                                    print("Select English")
                                }else if newValue == "Spanish" {
                                    print("Select Spanish")
                                }else if newValue == "Italian" {
                                    print("Select Italian")
                                }else if newValue == "French" {
                                    print("Select French")
                                }else if newValue == "German" {
                                    print("Select German")
                                }
                                
                                withAnimation(.easeInOut(duration: 1).delay(0.1)) {
                                    isExpanded.toggle()
                                }
                            }
                        
                    }
                    .frame(height: 200)
                    .padding(.top, 10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 1)
                            .frame(height: 210)
                    )
                    
                }
                
            }
            .padding(.top, 150)
            .padding(.horizontal)
            
        }
        .padding(.top, 120)
        .padding(.horizontal)
        
        
        
    }
    
}

struct SingleSelectionList: View {
    
    public var recibedItems: [String]
    @Binding var selected: String
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            
            List {
                ForEach(recibedItems, id: \.self) { item in
                    SelectionRow(title: item, selectedItem: $selected)
                }
            }
            .listStyle(.inset)
        }
    }
}

struct SelectionRow: View {
    typealias Action = (String) -> Void
    
    let title: String
    @Binding var selectedItem: String
    
    var action: Action?
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 16))
            Spacer()
            if title == selectedItem {
                
                Circle()
                    .fill(Color(title == selectedItem ? Color.orange : Color.gray))
                    .frame(width: 20, height: 20)
                    .overlay(Circle().stroke(Color.orange, lineWidth: 1))
                    .overlay {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 6)
                    }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            self.selectedItem = self.title
        }
    }
}
