//
//  ToDo.swift
//  To-Do List
//
//  Created by Daniel on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import Foundation



class ToDo : Codable {
    var title: String
    var date: String
    var category: String
    var description: String
    var isComplete: Bool
    
    init(title: String, date: String, category: String, description: String, isComplete: Bool) {
        self.title = title
        self.date = date
        self.category = category
        self.description = description
        self.isComplete = isComplete
    }
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.dateFormat = "dd-MM-yyyy HH:mm"
        return formatter
    }()
    static func getArchiveURL() -> URL {
        let plistName = "toDos"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName).appendingPathExtension("plist")
    }
    static func saveToFile(toDos: [ToDo]) {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedToDos = try? propertyListEncoder.encode(toDos)
        try? encodedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    static func loadFromFile() -> [ToDo]? {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        guard let retrievedToDosData = try? Data(contentsOf: archiveURL) else {return nil}
        guard let decodedToDos = try? propertyListDecoder.decode(Array<ToDo>.self, from: retrievedToDosData) else {return nil}
        return decodedToDos
    }
}

