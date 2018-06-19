//
//  ToDo.swift
//  To-Do List
//
//  Created by Daniel on 19/6/18.
//  Copyright © 2018 Edgefield. All rights reserved.
//

import Foundation

class ToDo {
    var title: String
    var date: Date
    var category: String
    var description: String
    var finishChecker: Bool
    
    init(title: String, date: Date, category: String, description: String) {
        self.title = title
        self.date = date
        self.category = category
        self.description = description
        self.finishChecker = finishChecker
    }
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }()
}
