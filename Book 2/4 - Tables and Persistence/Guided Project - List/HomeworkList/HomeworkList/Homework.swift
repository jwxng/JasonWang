//
//  ToDo.swift
//  ToDoList
//
//  Created by Student on 2020-06-03.
//  Copyright © 2020 Student. All rights reserved.
//

import Foundation

struct Homework: Codable {
    var subject: Subject
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("homework").appendingPathExtension("plist")
    
    static func loadHomework() -> [Homework]? {
        guard let codedHomework = try? Data(contentsOf: ArchiveURL) else { return nil }
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Homework>.self, from: codedHomework)
    }
    
    static func saveHomework(_ homeworkList: [Homework]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedHomework = try? propertyListEncoder.encode(homeworkList)
        try? codedHomework?.write(to: ArchiveURL, options: .noFileProtection)
    }
    
    static func loadSampleHomework() -> [Homework] {
        let physicsHomework = Homework(subject: .physics, title: "One", isComplete: false, dueDate: Date(), notes: "Physics Homework")
        let englishHomework = Homework(subject: .english, title: "Two", isComplete: false, dueDate: Date(), notes: "English Homework")
        let co_opHomework = Homework(subject: .co_op, title: "Three", isComplete: false, dueDate: Date(), notes: "Co-Op Homework")
        
        return [physicsHomework, englishHomework, co_opHomework]
    }
    
    static let dueDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()

}

enum Subject {
    case physics, english, co_op
}
