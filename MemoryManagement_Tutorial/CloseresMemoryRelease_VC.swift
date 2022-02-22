//
//  CloseresMemoryRelease_VC.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 15/02/22.
//

import UIKit

class CloseresMemoryRelease_VC: UIViewController {
    
    
    @IBOutlet weak var lbl_sample: UILabel!
    @IBOutlet weak var lbl_sample1: UILabel!
    
    //... Animation Closures Memory release
//    func doAnimatin(showLabel:Bool) {
//
//        let text = "Some text"
//
//        //... Closures memory release
//
//        //... [weak label = self.lbl_sample!]
//        //... [unowned label = self.lbl_sample!]
//        UIView.animate(withDuration: 0.3) { [weak label = self.lbl_sample!] in
//            if showLabel {
//                label?.alpha = 1
//            }
//            else{
//                label?.alpha = 0
//            }
//            label?.text = text
//        }
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
   
    @IBAction func btn_backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    
}



















































































































