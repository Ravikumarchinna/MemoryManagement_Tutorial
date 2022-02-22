//
//  SecondViewController.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 20/02/22.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var lbl_selctedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPopupVC" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
            //...WAY:: 1  Callbacks way of accessing the data
          //  popup.onSave = onSave(_:)
            
            //...WAY:: 2 Using closures to get the data
            popup.onSave = {(data:String) in
                self.lbl_selctedLabel.text = data
            }
            
        }
    }
    
    //...WAY:: 1  Callbacks way of accessing the data

//    func onSave(_ date:String)->() {
//        self.lbl_selctedLabel.text = date
//    }
}










































































