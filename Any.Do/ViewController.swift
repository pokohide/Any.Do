//
//  ViewController.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import SWTableViewCell

class ViewController: UITableViewController, SWTableViewCellDelegate {
    
    private var addButton: UIBarButtonItem!
    
    var items = ["item1", "item 2", "item 3"]

    // MARK: -UITableView DataSource / Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) //as! SWTableViewCell
        //cell.leftUtilityButtons = self.getLeftUtilityButtonsToCell() as [AnyObject]
        //cell.delegate = self
        
//        let df = DateFormatter()
//        df.locale = Locale(identifier: "ja_JP")
//        df.timeZone = TimeZone.current
//        df.dateFormat = "MM/dd"
//        let dateStr = df.string(from: entry.publishedDate as Date)
        
        //cell.titleLabel.text = [dateStr,entry.title].joined(separator: " ")
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        self.view.backgroundColor = UIColor.cyan
        self.title = "Any.Do"

        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.onClickAddButton(sender:)))
        self.navigationItem.rightBarButtonItem = addButton
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            tableView.beginUpdates()
            items.remove(at: indexPath.row)
            let indexPaths = NSIndexPath(row: indexPath.row, section: indexPath.section)
            tableView.deleteRows(at: [indexPaths as IndexPath], with: .automatic)
            tableView.endUpdates()

        } else if editingStyle == .insert {
            // create
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func onClickAddButton(sender: UIBarButtonItem) {
        items.append("追加したよ")
        tableView.reloadData()
    }
    
    private func getLeftUtilityButtonsToCell() -> NSMutableArray {
        let utilityButtons: NSMutableArray = NSMutableArray()
        utilityButtons.sw_addUtilityButton(with: UIColor.red, title: NSLocalizedString("Delete", comment: ""))
        utilityButtons.sw_addUtilityButton(with: UIColor.yellow, title: NSLocalizedString("Edit", comment: ""))
        return utilityButtons
    }
    
    internal func swipeableTableViewCell(_ cell: SWTableViewCell!, didTriggerLeftUtilityButtonWith index: Int) {
        switch index {
        case 0:
            print("Push Delete Button")
        case 1:
            print("Push Edit Button")
        default:
            print("other")
        }
    }
}
