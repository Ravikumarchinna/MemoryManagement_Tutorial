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
    
    
    
    var observer:NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("sampleNotify"), object: nil)
        
    }
    
    
    @IBAction func btn_backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @objc func methodOfReceivedNotification(notification: Notification) {
//        // Take Action on Notification
//        print("notification center method called")
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "sampleNotify"), object: nil, queue: OperationQueue.main)
        { [unowned label = self.lbl_sample!,unowned lbl = self.lbl_sample1!](notitication) in
            label.text = "Sample String"
            lbl.text = "Sample String"
        }
    }
    
    
    //... Removing NSNotification Center
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: Notification.Name("sampleNotify"), object: nil)
    }
    
    //... Removing NSNotification Center
    deinit {
        print("Deallocated the Closure viewcontroller successfully")
    }
    
}



















































































































