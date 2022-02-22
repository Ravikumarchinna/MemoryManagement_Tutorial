//
//  SelectTimeViewController.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 20/02/22.
//

import UIKit

class SelectTimeViewController: UIViewController {

    
    @IBOutlet weak var lbl_displayString: UILabel!
   weak var popup:DatePopupViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    @IBAction func btn_selectTimeAction(_ sender: Any) {
        
//        let vc = storyboard?.instantiateViewController(identifier: "DatePopupViewController") as! DatePopupViewController
//        vc.showTimePicker = true
//        vc.deleagte = self
//        self.present(vc, animated: true)
        
        let sb = UIStoryboard(name: "ReusableDatePopup", bundle: nil)
        popup = sb.instantiateInitialViewController() as! DatePopupViewController
        popup?.showTimePicker = true
        popup?.deleagte = self
        self.present(popup!, animated: true)
    }
    
}

extension SelectTimeViewController:PopupDelegate{
    
    func someExtraStuff(value1:String){

    }

    func popupValueSelected(value: String) {
        lbl_displayString.text = value
        
        //...Another way is releasing memory
       //  popup?.deleagte = nil
       // popup = nil
    }
    
    
}













































































