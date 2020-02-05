//
//  FirstViewController.swift
//  Plan It
//
//  Created by Fiorella Sobenes on 1/23/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, TodoCheck {
    
    
    var tasks: [Task] = []
    

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tasks.append(Task(name: "Testing"))
        
        //self.popOver.layer.cornerRadius = 10
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)  as! TodoCell
        
        cell.tastNameLabel.text = tasks[indexPath.row].name
        
        if tasks[indexPath.row].checked{
            cell.checkboxOutlet.setBackgroundImage(UIImage(named:"filledTodo"), for: UIControl.State.normal)
        }else{
            cell.checkboxOutlet.setBackgroundImage(UIImage(named: "emptyTodo"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        
        return cell
    }
    
    
    //popup view
    
    @IBOutlet var popOver: UIView!
    @IBAction func addEvent(_ sender: Any) {
        //self.view.addSubview(popOver)
        //popOver.center = self.view.center
        
        //animation
//        popOver.transform = CGAffineTransform(scaleX: 1.3, y:  1.3)
//        popOver.alpha = 0
//
//        UIView.animate(withDuration: 0.5){
//            self.popOver.alpha = 1
//            self.popOver.transform = CGAffineTransform.identity
//        } //end of animation
    }
    
//    @IBAction func saveEvent(_ sender: Any) {
//        self.popOver.removeFromSuperview()
        
        //animation
//        UIView.animate(withDuration: 0.5, animations: {
//            self.popOver.alpha = 0
//            self.popOver.transform = CGAffineTransform(scaleX: 1.3, y: 1.3 )
//        }) { (_) in
//            self.popOver.removeFromSuperview()
//            print("did remove popOver......")//end of animation
//        }
    //}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! AddTodoController
        viewController.delegate = self
    }
    
    func addTask(name: String) {
        tasks.append(Task(name: name))
        tableView.reloadData()
    }
    
    func changeImgTodo(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }
    
    
    
    
}

class Task {
    var name = ""
    var checked = false
    
    convenience init(name: String){
        self.init()
        self.name = name
    }
}

