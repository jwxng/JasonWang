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
    
    enum CodingKeys: CodingKey {
        case subject, title, isComplete, dueDate, notes
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("homework").appendingPathExtension("plist")
    
    init(subject: Subject, title: String, isComplete: Bool, dueDate: Date, notes: String) {
        self.subject = subject
        self.title = title
        self.isComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let subject = try container.decode(Subject.self, forKey: .subject)
        let title = try container.decode(String.self, forKey: .title)
        let isComplete = try container.decode(Bool.self, forKey: .isComplete)
        let dueDate = try container.decode(Date.self, forKey: .dueDate)
        let notes = try container.decode(String.self, forKey: .notes)
        
        
        try self.init(subject: subject, title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(subject, forKey: .subject)
        try container.encode(title, forKey: .title)
        try container.encode(isComplete, forKey: .isComplete)
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(notes, forKey: .notes)
    }

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

enum Subject: Codable {
    enum CodingKeys: CodingKey {
        case physics, english, co_op
    }
    
    init(from decoder: Decoder) throws {
        try self.init(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .physics:
            var subject = Subject.physics
            try container.encode(subject, forKey: .physics)
        case .english:
            var subject = Subject.english
            try container.encode(subject, forKey: .english)
        case .co_op:
            var subject = Subject.co_op
            try container.encode(subject, forKey: .co_op)
        }
    }
    
    case physics, english, co_op
}
