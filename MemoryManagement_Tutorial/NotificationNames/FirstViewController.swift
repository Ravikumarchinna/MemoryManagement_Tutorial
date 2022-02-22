//
//  FirstViewController.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 20/02/22.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var lbl_selectedDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()



        
    }
    
    //... Notification: WAY 1

//    override func viewWillAppear(_ animated: Bool) {
//        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: .savedDateTime, object: nil)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//        NotificationCenter.default.removeObserver(self, name: .savedDateTime, object: nil)
//    }
//
//    @objc func handleNotification(notification:Notification){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let myStringDate = formatter.string(from: notification.object as! Date)
//        self.lbl_selectedDate.text = myStringDate
//        print("Data selected...")
//
//    }
    //... Notification: WAY 1

    
    //... Notification: WAY 2
    var observer:NSObjectProtocol?
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        observer =   NotificationCenter.default.addObserver(forName: .savedDateTime, object: nil, queue: OperationQueue.main) {[unowned self] (notification) in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let myStringDate = formatter.string(from: notification.object as! Date)
            self.lbl_selectedDate.text = myStringDate
            print("Data selected...")
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    //... Notification: WAY 2

        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDatePopupViewController" {
            let popup = segue.destination as! DatePopupViewController
            popup.showTimePicker = false
        }
    }
    
    deinit {
        print("Notification VC is Released from memory")
    }
    

}




















































































