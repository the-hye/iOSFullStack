//
//  UIViewController+URL.swift
//  BTSApp
//
//  Created by Jihye Seok on 3/18/25.
//
import UIKit

extension UIViewController {
    func urlForDocuments() -> URL {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[0]
    }
    func urlWithFileName(_ fileName: String) -> URL {
        let url = urlForDocuments()
        let fileURL = url.appendingPathComponent(fileName, conformingTo: .propertyList)
        
        return fileURL
    }
}
