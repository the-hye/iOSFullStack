//
//  Diary.swift
//  DiaryApp
//
//  Created by Jihye Seok on 3/19/25.
//

import Foundation

struct Diary: Codable {
    let id: UUID
    let title: String
    var content: String?
    let date: Date
    let imagePath: String?
}
