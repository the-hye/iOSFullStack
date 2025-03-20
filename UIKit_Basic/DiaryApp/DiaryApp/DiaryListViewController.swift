//
//  DiaryListViewController.swift
//  DiaryApp
//
//  Created by Jihye Seok on 3/19/25.
//

import UIKit

class DiaryListViewController: UIViewController {
    private var tableView = UITableView()
    private var diaries: [Diary] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDiaries()
        setupUI()
    }
    
    private func setupUI() {
        title = "지혜의 일기"
        view.backgroundColor = .white
        tableView.rowHeight = 130
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addDiary))
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        tableView.register(DiaryCell.self, forCellReuseIdentifier: "DiaryCell")
        view.addSubview(tableView)
    }
    
    @objc private func addDiary() {
        let addVC = DiaryAddViewController()
        addVC.onSave = { [weak self] in
            self?.loadDiaries()
        }
        navigationController?.pushViewController(addVC, animated: true)
    }
    
    private func loadDiaries() {
        diaries = DiaryManager.shared.loadDiaries()
        tableView.reloadData()
    }
}

extension DiaryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(diaries.count)
        return diaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiaryCell", for: indexPath) as! DiaryCell
        let diary = diaries[indexPath.row]
        print(diary)
        cell.configure(with: diary)
        return cell
    }
}

extension DiaryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDiary = diaries[indexPath.row]
        let detailVC = DiaryDetailViewController(diary: selectedDiary)
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let diary = diaries[indexPath.row]
            diaries.remove(at: indexPath.row)
            DiaryManager.shared.saveDiaries(diaries)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
            if let imagePath = diary.imagePath {
                let fileManager = FileManager.default
                let fileURL = DiaryManager.shared.getDocumentsDirection().appendingPathComponent(imagePath)
                try? fileManager.removeItem(at: fileURL)
            }
        }
    }
}
