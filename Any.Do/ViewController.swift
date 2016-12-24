//
//  ViewController.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit
import SWTableViewCell

class ViewController: UITableViewController {
    
    private var addButton: UIBarButtonItem!
    
    var items = ["item1", "item 2", "item 3"]

    // MARK: -UITableView DataSource / Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let items = items {
//            return items.count
//        }
        return items.count //|| 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
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
        self.title = "My Navigation"
        
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(ViewController.onClickAddButton(sender:)))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            items.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // create
        }
    }
    
    func onClickAddButton(sender: UIBarButtonItem) {
        items.append("追加したよ")
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
