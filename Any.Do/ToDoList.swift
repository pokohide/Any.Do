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
    //private var items: [ToDo] = []
    
    var items: Results<ToDo>? {
        do {
            let realm = try Realm()
            return realm.objects(ToDo.self)
        } catch {
            print("error occured")
        }
        return nil
    }
}
