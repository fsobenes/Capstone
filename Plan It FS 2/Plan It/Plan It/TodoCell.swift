 //
//  TodoCell.swift
//  Plan It
//
//  Created by Fiorella Sobenes on 1/28/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

 
 //todo cell class
 
import UIKit

 protocol TodoCheck {
    func changeImgTodo(checked: Bool, index: Int)
 }
 
class TodoCell: UITableViewCell {

    @IBOutlet weak var checkboxOutlet: UIButton!
    @IBOutlet weak var tastNameLabel: UILabel!
    
    
    @IBAction func checkboxAction(_ sender: Any) {
        if tasks![indexP!].checked{
            delegate?.changeImgTodo(checked: false, index: indexP!)
        }else{
            delegate?.changeImgTodo(checked: true, index: indexP!)

        }
    }
    
    
    var delegate: TodoCheck?
    var indexP: Int?
    var tasks: [Task]?

}
