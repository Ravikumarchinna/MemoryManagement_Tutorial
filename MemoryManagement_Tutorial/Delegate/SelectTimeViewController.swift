//
//  SelectTimeViewController.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 20/02/22.
//

import UIKit

class SelectTimeViewController: UIViewController {

    
    @IBOutlet weak var lbl_displayString: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func btn_selectTimeAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "DatePopupViewController") as! DatePopupViewController
        vc.showTimePicker = true
        vc.deleagte = self
        self.present(vc, animated: true)
        
    }
    
}

extension SelectTimeViewController:PopupDelegate{
    func popupValueSelected(value: String) {
        lbl_displayString.text = value
    }
    
    
}













































































