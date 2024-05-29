//
//  ProfileView.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/29/24.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    @State private var selectedLanguageIndex = 0
    let languages = ["English", "Spanish", "German"]
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()
            
            // Dropdown menu for language selection
            Picker(selection: $selectedLanguageIndex, label: Text("Language")) {
                ForEach(0..<languages.count) { index in
                    Text(self.languages[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("Save") {
                saveLanguage()
            }
            
            Spacer()
        }
    }
    
    func saveLanguage() {
        let languageCode: String
        switch selectedLanguageIndex {
            case 0: languageCode = "en"
            case 1: languageCode = "es"
            case 2: languageCode = "de"
            default: languageCode = "en"
        }
        
        LocalizationManager.shared.currentLanguage = languageCode
    }
}
