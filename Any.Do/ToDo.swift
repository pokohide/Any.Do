//
//  ToDo.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import Foundation
import RealmSwift

class ToDo: Object {
    
    dynamic var name = ""
    dynamic var body = ""
    dynamic var deadLine = NSDate(timeIntervalSince1970: 0)
    dynamic var isComplete = false
    
}
