//
//  IntentionsController.swift
//  Plan It
//
//  Created by Fiorella Sobenes on 1/23/20.
//  Copyright © 2020 Fiorella Sobenes. All rights reserved.
//

import UIKit

class IntentionsController: UIViewController {
    @IBOutlet var popOver: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.popOver.layer.cornerRadius = 10

    }
    

    @IBAction func popBt(_ sender: Any) {
        self.view.addSubview(popOver)
        popOver.center = self.view.center
        
        //animation
               popOver.transform = CGAffineTransform(scaleX: 1.3, y:  1.3)
               popOver.alpha = 0
               
               UIView.animate(withDuration: 0.5){
                   self.popOver.alpha = 1
                   self.popOver.transform = CGAffineTransform.identity
               } //end of animation
    }
    
    @IBAction func saveEvent(_ sender: Any) {
        //self.popOver.removeFromSuperview()
               
               //animation
               UIView.animate(withDuration: 0.5, animations: {
                   self.popOver.alpha = 0
                   self.popOver.transform = CGAffineTransform(scaleX: 1.3, y: 1.3 )
               }) { (_) in
                   self.popOver.removeFromSuperview()
                   print("did remove popOver......")//end of animation
               }    }
    
}
