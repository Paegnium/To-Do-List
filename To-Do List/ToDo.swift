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
    var date: Date
    var category: String
    var description: String
    
    init(title: String, date: Date, category: String, description: String) {
        self.title = title
        self.date = date
        self.category = category
        self.description = description
    }
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
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

