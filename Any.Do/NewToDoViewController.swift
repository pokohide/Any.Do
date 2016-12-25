//
//  NewToDoViewController.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import RealmSwift

class NewToDoViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var bodyField: UITextView!
    @IBOutlet weak var deadlineField: UIDatePicker!

    var todo: ToDo? = nil
    enum State: String {
        case Update = "編集"
        case Create = "作成"
    }
    var state: State = .Create
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todo != nil {
            self.nameField.text = todo?.name
            self.bodyField.text = todo?.body
            self.deadlineField.date = todo?.deadline as! Date
            state = .Update
        } else {
            self.nameField.placeholder = "タスク名"
            self.deadlineField.date = Date()
            state = .Create
        }
        self.title = state.rawValue

        let saveButton = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(NewToDoViewController.onClickSaveButton(sender:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onClickSaveButton(sender: UIBarButtonItem) {
        if isValidate() == false {
            return
        }
        if state == .Create {
            ToDoList().create(name: nameField.text!, body: bodyField.text, deadline: deadlineField.date)
        } else if state == .Update {
            ToDoList().update(todo: todo, name: nameField.text!, body: bodyField.text, deadline: deadlineField.date)
        }
        self.performSegue(withIdentifier: "returnToDoList", sender: self)
    }
    
    private func isValidate() -> Bool {
        if let name = nameField.text {
            if name.characters.count == 0 {
                return false
            }
        } else {
            return false
        }
        return true
    }
}
