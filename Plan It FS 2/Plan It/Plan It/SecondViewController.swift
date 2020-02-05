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

class SecondViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    
    fileprivate lazy var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            return formatter
        }()
        fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
            [unowned self] in
            let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
            panGesture.delegate = self
            panGesture.minimumNumberOfTouches = 1
            panGesture.maximumNumberOfTouches = 2
            return panGesture
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            if UIDevice.current.model.hasPrefix("iPad") {
                self.calendarHeightConstraint.constant = 400
            }
            
            self.calendar.select(Date())
            
            self.view.addGestureRecognizer(self.scopeGesture)
            self.tableView.panGestureRecognizer.require(toFail: self.scopeGesture)
            self.calendar.scope = .week
            
            // For UITest
            self.calendar.accessibilityIdentifier = "calendar"
            
        }
        
        deinit {
            print("\(#function)")
        }
        
        // MARK:- UIGestureRecognizerDelegate
        
        func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
            let shouldBegin = self.tableView.contentOffset.y <= -self.tableView.contentInset.top
            if shouldBegin {
                let velocity = self.scopeGesture.velocity(in: self.view)
                switch self.calendar.scope {
                case .month:
                    return velocity.y < 0
                case .week:
                    return velocity.y > 0
                @unknown default:
                    return true
                }
            }
            return shouldBegin
        }
        
        func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
            self.calendarHeightConstraint.constant = bounds.height
            self.view.layoutIfNeeded()
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            print("did select date \(self.dateFormatter.string(from: date))")
            let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
            print("selected dates is \(selectedDates)")
            if monthPosition == .next || monthPosition == .previous {
                calendar.setCurrentPage(date, animated: true)
            }
        }

        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            print("\(self.dateFormatter.string(from: calendar.currentPage))")
        }
        
        // MARK:- UITableViewDataSource
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return [2,20][section]
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.section == 0 {
                let identifier = ["cell_month", "cell_week"][indexPath.row]
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
                return cell
            }
        }
        
        
        // MARK:- UITableViewDelegate
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            if indexPath.section == 0 {
                let _: FSCalendarScope = (indexPath.row == 0) ? .month : .week
                //self.calendar.setScope(scope, animated: self.animationSwitch.isOn)
            }
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 10
        }
    




































//    var tasks: [Tasks] = []
//
//
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var calendarHeightConstraint: NSLayoutConstraint!
//
//
//    fileprivate lazy var dateFormatter: DateFormatter = {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy/MM/dd"
//        return formatter
//    }()
//
//    fileprivate lazy var scopeGesture: UIPanGestureRecognizer = {
//        [unowned self] in
//        let panGesture = UIPanGestureRecognizer(target: self.calendar, action: #selector(self.calendar.handleScopeGesture(_:)))
//        panGesture.delegate = self
//        panGesture.minimumNumberOfTouches = 1
//        panGesture.maximumNumberOfTouches = 2
//        return panGesture
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.calendar.select(Date())
//
//        self.view.addGestureRecognizer(self.scopeGesture)
//        self.tableView.panGestureRecognizer.require(toFail: self.scopeGesture)
//        self.calendar.scope = .week
//
//        self.calendar.accessibilityIdentifier = "calendar"
//    }
//
//    deinit {
//        print("\(#function)")
//    }
//
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//        let shouldBegin = self.tableView.contentOffset.y <= -self.tableView.contentInset.top
//        if shouldBegin {
//            let velocity = self.scopeGesture.velocity(in: self.view)
//            switch self.calendar.scope {
//            case .month:
//                return velocity.y < 0
//            case .week:
//                return velocity.y > 0
//            @unknown default:
//                return velocity.y == 0
//            }
//        }
//        return shouldBegin
//    }
//
//
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        print("did select date \(self.dateFormatter.string(from: date))")
//        let selectedDates = calendar.selectedDates.map({self.dateFormatter.string(from: $0)})
//        print("selected dates is \(selectedDates)")
//        if monthPosition == .next || monthPosition == .previous {
//            calendar.setCurrentPage(date, animated: true)
//        }
//    }
//
//    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
//        print("\(self.dateFormatter.string(from: calendar.currentPage))")
//    }
//
//
//    //table data source
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return [2,20][section]
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if indexPath.section == 0 {
//            let identifier = ["cell_month", "cell_week"][indexPath.row]
//            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//           let cell = tableView.dequeueReusableCell(withIdentifier: identifier)!
//            return cell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
//            return cell
//        }
//    }
//
//    // table delegate
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        if indexPath.section == 0 {
//           // let scope: FSCalendarScope = (indexPath.row == 0) ? .month : .week
//           // self.calendar.setScope(scope, animated: self.animationSwitch.isOn)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat(tasks.count)
//    }
//
//
//}
//
//
//class Tasks {
//    var name = ""
//    var checked = false
//
//    convenience init(name: String){
//        self.init()
//        self.name = name
//    }
//}
