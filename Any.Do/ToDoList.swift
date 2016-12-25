//
//  ToDoList.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation
import RealmSwift

class ToDoList {

    var items: Results<ToDo>? {
        let realm = try! Realm()
        return realm.objects(ToDo.self)
    }
    
    func delete(index: Int) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete((items?[index])!)
            }
        } catch {
            print("realm delete error")
        }
    }
    
    func create(name: String, body: String, deadline: Date) {
        let toDo = ToDo()
        toDo.name = name
        toDo.body = body
        toDo.deadline = deadline as NSDate
        toDo.isComplete = false
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(toDo)
            }
        } catch {
            print("realm add error")
        }
    }
    
    func update(todo: ToDo?, name: String, body: String, deadline: Date) {
        do {
            let realm = try Realm()
            try realm.write {
                todo?.name = name
                todo?.body = body
                todo?.deadline = deadline as NSDate
            }
        } catch {
            print("update error")
        }
    }
}
