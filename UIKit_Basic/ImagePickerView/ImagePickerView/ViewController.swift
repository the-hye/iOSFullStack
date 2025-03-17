//
//  ViewController.swift
//  ImagePickerView
//
//  Created by Jihye Seok on 3/17/25.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {
    var camera = UIImagePickerController()
    var picker: PHPickerViewController?
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.sourceType = .camera
        camera.delegate = self
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        picker = PHPickerViewController(configuration: config)
        picker?.delegate = self
    }


    @IBAction func pickImage(_ sender: Any) {
        self.present(picker!, animated: true)
    }
    @IBAction func takePicture(_ sender: Any) {
        self.present(camera, animated: true)
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let image = info[.originalImage] as? UIImage
        imageView.image = image
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        if let provider = results.first?.itemProvider {
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, error in
                    if let error {
                        print("에러다")
                    }
                    if let image = image as? UIImage {
                        DispatchQueue.main.async {
                            self.imageView.image = image
                        }
                    }
                }
            }
        }
    }
}
