//
//  ViewController.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoTableViewController: UITableViewController {

    var todoList = ToDoList()
    var todo: ToDo?
    
    @IBOutlet weak var addButton: UIBarButtonItem!

    override func viewDidLoad() {
        self.view.backgroundColor = UIColor(red: CGFloat(238 / 255.0), green: CGFloat(238 / 255.0), blue: CGFloat(238 / 255.0), alpha: 1)
        super.viewDidLoad()
        self.title = "Any.Do"
        addButton.target = self
        addButton.action = #selector(ToDoTableViewController.onClickAddButton(sender:))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.items?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        cell.todo = (todoList.items?[indexPath.row])!
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    override func tableView(_ table: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ToDoTableViewCell
        self.todo = cell.todo
        self.performSegue(withIdentifier: "toNewToDoViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toNewToDoViewController") {
            let newToDoVC = segue.destination as! NewToDoViewController
            newToDoVC.todo = self.todo
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            todoList.delete(index: indexPath.row)
            let indexPaths = NSIndexPath(row: indexPath.row, section: indexPath.section)
            tableView.deleteRows(at: [indexPaths as IndexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    func onClickAddButton(sender: UIBarButtonItem) {
        self.todo = nil
        self.performSegue(withIdentifier: "toNewToDoViewController", sender: self)
    }

    @IBAction func returnToDoList(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}
