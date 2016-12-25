//
//  ToDoList.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation
import RealmSwift
//
//class ToDoList {
//    private var items: [ToDo] = []
//}

class ToDoList {
    //private var items: [ToDo] = []
    
    class ToDoModel: NSObject {
        var name: String
        var date: String
        var body: String
        
        init(name: String, date: String, body: String) {
            self.name = name
            self.date = date
            self.body = body
        }
    }
    var items = [
        ToDoModel(name: "name 1", date: "date 1", body: "body 1"),
        ToDoModel(name: "name 2", date: "date 2", body: "body 2"),
        ToDoModel(name: "name 3", date: "date 3", body: "body 3"),
        ToDoModel(name: "name 4", date: "date 4", body: "body 4")
    ]
}
