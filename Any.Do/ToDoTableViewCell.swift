//
//  ToDoTableViewCell.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var date: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func initCell(todo: ToDoList.ToDoModel) {
        
        name.text = todo.name
        date.text = todo.date
    }
}
