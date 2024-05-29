//
//  ViewModel.swift
//  OutCodingAssignment
//
//  Created by Rey Messon on 5/15/24.
//

import Foundation
import UIKit

class CatViewModel: ObservableObject {
    @Published var catImages: [CatImage] = []
    let cacheDirectory = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first!
    
    func fetchCatImages(completion: @escaping () -> Void) {
        guard let url = URL(string: "https://cataas.com/api/cats?limit=10&skip=0") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let decoder = JSONDecoder()
                let catData = try decoder.decode([CatImage].self, from: data)
                
                DispatchQueue.main.async {
                    self.catImages = catData
                    self.cacheImages(catData)
                    completion() 
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func cacheImages(_ catImages: [CatImage]) {
        for catImage in catImages {
            let imageUrl = catImage.imageUrl
            let fileName = imageUrl.lastPathComponent
            let fileURL = cacheDirectory.appendingPathComponent(fileName)
            
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    let imageData = try Data(contentsOf: imageUrl)
                    try imageData.write(to: fileURL)
                } catch {
                    print("Error caching image: \(error)")
                }
            }
        }
    }
    
    func cachedImage(for imageUrl: URL) -> UIImage? {
        let fileName = imageUrl.lastPathComponent
        let fileURL = cacheDirectory.appendingPathComponent(fileName)
        
        guard FileManager.default.fileExists(atPath: fileURL.path) else {
            return nil
        }
        
        if let imageData = FileManager.default.contents(atPath: fileURL.path) {
            return UIImage(data: imageData)
        }
        
        return nil
    }
}
