//
//  DiaryManager.swift
//  DiaryApp
//
//  Created by Jihye Seok on 3/19/25.
//

import UIKit

class DiaryManager {
    static let shared = DiaryManager()
    private let userDefaultsKey = "diaries"
    
    private init() {}
    
    func getDocumentsDirection() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    func saveDiaries(_ diaries: [Diary]) {
        if let data = try? JSONEncoder().encode(diaries) {
            UserDefaults.standard.set(data, forKey: userDefaultsKey)
        }
    }
    
    func saveImageToDocuments(image: UIImage) -> String? {
        let fileName = UUID().uuidString + ".jpg"
        let fileURL = getDocumentsDirection().appendingPathComponent(fileName)
        
        guard let data = image.jpegData(compressionQuality: 0.8) else { return nil }
        
        do {
            try data.write(to: fileURL)
            return fileName
        } catch {
            print("이미지 저장 실패: \(error.localizedDescription)")
            return nil
        }
    }
    
    func loadDiaries() -> [Diary] {
        if let data = UserDefaults.standard.data(forKey: userDefaultsKey),
           let diaries = try? JSONDecoder().decode([Diary].self, from: data) {
            return diaries
        }
        return []
    }
    
    func loadImage(from path: String) -> UIImage? {
        let fileURL = getDocumentsDirection().appendingPathComponent(path)
        return UIImage(contentsOfFile: fileURL.path())
    }
}
