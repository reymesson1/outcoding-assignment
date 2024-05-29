//
//  LocalizationManager.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/29/24.
//

import Foundation
import Combine

final class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()

    @Published var currentLanguage: String

    private var cancellables = Set<AnyCancellable>()

    private init() {
        self.currentLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? Locale.current.languageCode ?? "en"
    }
    
    func changeLanguage(to languageCode: String) {
        currentLanguage = languageCode
        UserDefaults.standard.set(languageCode, forKey: "selectedLanguage")
        UserDefaults.standard.synchronize()
    }
}
