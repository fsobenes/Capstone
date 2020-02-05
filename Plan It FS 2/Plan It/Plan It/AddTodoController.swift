//
//  AddTodoController.swift
//  Plan It
//
//  Created by Fiorella Sobenes on 2/5/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

protocol AddTask {
    func addTask(name: String)
}

class AddTodoController: UIViewController {
   
    var delegate: AddTask?
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var taskMemo: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTask(_ sender: Any) {
        if taskName.text != ""{
            delegate?.addTask(name: taskName.text!)
            
            navigationController?.popViewController(animated: true)
        }
        
    
    }
    

}
