//
//  DiaryCell.swift
//  DiaryApp
//
//  Created by Jihye Seok on 3/19/25.
//

import UIKit

class DiaryCell: UITableViewCell {
    private let diaryImageView = UIImageView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        diaryImageView.contentMode = .scaleAspectFit
        diaryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        dateLabel.font = UIFont.systemFont(ofSize: 17)
        dateLabel.textColor = .secondaryLabel
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(diaryImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            diaryImageView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            diaryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            diaryImageView.widthAnchor.constraint(equalToConstant: 100),
            diaryImageView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.leadingAnchor.constraint(equalTo: diaryImageView.trailingAnchor, constant: 20),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            dateLabel.leadingAnchor.constraint(equalTo: diaryImageView.trailingAnchor, constant: 20),
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 20),
        ])
    }
    
    func configure(with diary: Diary) {
        titleLabel.text = diary.title
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateLabel.text = dateFormatter.string(from: diary.date)
        
        if let imagePath = diary.imagePath,
           let image = DiaryManager.shared.loadImage(from: imagePath) {
            diaryImageView.image = image
        } else {
            diaryImageView.image = UIImage(systemName: "photo")
        }
    }
}
