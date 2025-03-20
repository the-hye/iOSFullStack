//
//  DiaryAddViewController.swift
//  DiaryApp
//
//  Created by Jihye Seok on 3/19/25.
//

import UIKit
import PhotosUI

class DiaryAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PHPickerViewControllerDelegate {
    
    var onSave: (() -> Void)?
    private var titleTextField = UITextField()
    private var contentTextView = UITextView()
    private var datePicker = UIDatePicker()
    private var imageView = UIImageView()
    
    var imageFileName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveDiary))
        
        titleTextField.font = UIFont.boldSystemFont(ofSize: 20)
        titleTextField.placeholder = "제목을 입력하세요."
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        contentTextView.font = .systemFont(ofSize: 17)
        contentTextView.layer.borderWidth = 1
        contentTextView.layer.borderColor = UIColor.gray.cgColor
        contentTextView.layer.cornerRadius = 5
        contentTextView.translatesAutoresizingMaskIntoConstraints = false
        
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.image = UIImage(systemName: "photo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        var config = UIButton.Configuration.filled()
        config.title = "이미지 추가"
        let imageButton = UIButton(configuration: config)
        imageButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        imageButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleTextField)
        view.addSubview(contentTextView)
        view.addSubview(datePicker)
        view.addSubview(imageView)
        view.addSubview(imageButton)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            
            titleTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            contentTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            contentTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentTextView.heightAnchor.constraint(equalToConstant: 200),
            
            datePicker.topAnchor.constraint(equalTo: contentTextView.bottomAnchor, constant: 20),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageButton.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
            imageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
    }
    
    @objc func selectImage() {
        let actionSheet = UIAlertController(title: "이미지 선택", message: "사진을 찍거나 앨범에서 선택하세요.", preferredStyle: .actionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            actionSheet.addAction(UIAlertAction(title: "카메라로 촬영하기", style: .default) { _ in
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .camera
                imagePickerController.delegate = self
                self.present(imagePickerController, animated: true, completion: nil)
            })
        }
        
        actionSheet.addAction(UIAlertAction(title: "앨범에서 불러오기", style: .default, handler: { _ in
            var configuration = PHPickerConfiguration()
            configuration.selectionLimit = 1
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel))
        present(actionSheet, animated: true)
    }
    
    @objc private func saveDiary() {
        let title = titleTextField.text ?? ""
        let content = contentTextView.text ?? ""
        let date = datePicker.date
        
        if let image = imageView.image {
            imageFileName = DiaryManager.shared.saveImageToDocuments(image: image)
        }
        
        let diary = Diary(id: UUID(), title: title, content: content, date: date, imagePath: imageFileName)
        
        var diaries = DiaryManager.shared.loadDiaries()
        diaries.append(diary)
        
        DiaryManager.shared.saveDiaries(diaries)
        
        onSave?()
        
        navigationController?.popViewController(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        if let result = results.first {
            result.itemProvider.loadObject(ofClass: UIImage.self) { [weak self] (object, error) in
                if let image = object as? UIImage {
                    DispatchQueue.main.async {
                        self?.imageView.image = image
                    }
                }
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
