//
//  AddViewController.swift
//  BTSApp
//
//  Created by Jihye Seok on 3/18/25.
//

import UIKit
import PhotosUI

class AddViewController: UIViewController {
    var bts: NSMutableArray?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textDesc: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var textNick: UITextField!
    
    var camera = UIImagePickerController()
    var picker: PHPickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        camera.sourceType = .camera
        camera.delegate = self
        
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        picker = PHPickerViewController(configuration: config)
        picker?.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        let alert = UIAlertController(title: "사진 불러오기", message: "사진을 불러올 방식을 선택하세요.", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "카메라로 찍기", style: .default) { _ in
            self.present(self.camera, animated: true)
        }
        let album = UIAlertAction(title: "앨범에서 불러오기", style: .default) { _ in
            self.present(self.picker!, animated: true)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        alert.addAction(camera)
        alert.addAction(album)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        let imageName: String? = UUID().uuidString + ".png"
        let data = imageView.image?.jpegData(compressionQuality: 0.5)
        try? data?.write(to: urlWithFileName(imageName!))
        print(urlWithFileName(imageName!))
        
        let newMember = ["nick": textNick.text!, "name": textName.text!, "desc": textDesc.text!, "image": imageName]
        bts?.add(newMember)
        
        do {
            try bts?.write(to: urlWithFileName("bts.plist"))
        } catch {
            print("저장 실패")
            return
        }
        let alert = UIAlertController(title: "새 멤버 추가", message: "새로운 멤버 추가 성공", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: .default) { _ in
            self.performSegue(withIdentifier: "back", sender: self)
//            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        present(alert, animated: true)
    }

}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let image = info[.originalImage] as? UIImage
        imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension AddViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        
        if let provider = results.first?.itemProvider {
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, error in
                    if let error {
                        print("\(error.localizedDescription)")
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
