//
//  ViewModel.swift
//  OutCodingAssignment
//
//  Created by user258061 on 5/15/24.
//

import Foundation

class CatViewModel: ObservableObject {
    @Published var catImages: [CatImage] = []
    
    func fetchCatImages() {
        guard let url = URL(string: "https://cataas.com/api/cats?limit=10&skip=0") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let catData = try decoder.decode([CatImage].self, from: data)
                
                DispatchQueue.main.async {
                    self.catImages = catData
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}
