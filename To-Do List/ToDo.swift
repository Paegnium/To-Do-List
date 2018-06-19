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
    var date: String
    var category: String
    var description: String
    
    init(title: String, date: String, category: String, description: String) {
        self.title = title
        self.date = date
        self.category = category
        self.description = description
    }
}
