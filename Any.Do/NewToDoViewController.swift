//
//  NewToDoViewController.swift
//  Any.Do
//
//  Created by 酒井英伸 on 2016/12/25.
//  Copyright © 2016年 pokohide. All rights reserved.
//

import UIKit

class NewToDoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = UIColor.green
        self.title = "ToDo作成"

        let addButton = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(NewToDoViewController.onClickAddButton(sender:)))
        self.navigationItem.rightBarButtonItem = addButton
        
        
        let backButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func onClickAddButton(sender: UIBarButtonItem) {
        print("hogehogehoge")
    }
    
    private func createToDo() -> Bool {
    //        let df = DateFormatter()
    //        df.locale = Locale(identifier: "ja_JP")
    //        df.timeZone = TimeZone.current
    //        df.dateFormat = "MM/dd"
    //        let dateStr = df.string(from: entry.publishedDate as Date)
        return true
    }
}
