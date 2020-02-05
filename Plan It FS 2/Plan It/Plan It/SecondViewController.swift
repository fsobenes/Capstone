//
//  SecondViewController.swift
//  Plan It
//
//  Created by Fiorella Sobenes on 1/23/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

//01/23/2020

import UIKit
import FSCalendar

class SecondViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDataSource, UITableViewDelegate{ //, UIGestureRecognizerDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!


    override func viewDidLoad() {
        super.viewDidLoad()

        calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "CELL")

//        self.calendar.select(Date())
//
//        self.calendar.accessibilityIdentifier = "calendar"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let identifier = ["cell_month", "cell_week"][indexPath.row]
//            let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
//            return cell
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            return cell
        //}
    }
   

   
}

class Tasks {
    var name = ""
    var checked = false

    convenience init(name: String){
        self.init()
        self.name = name
    }
    }
