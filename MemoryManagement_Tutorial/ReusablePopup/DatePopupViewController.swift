//
//  DatePopupViewController.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 20/02/22.
//

import UIKit

class DatePopupViewController: UIViewController {

    
    @IBOutlet weak var lbl_titleLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var btn_saveButton: UIButton!
    
    var showTimePicker:Bool = false
    var data:Date?
    
    var onSave:((_ date:String)->())?
    weak var deleagte:PopupDelegate?
    
    
    
    var formattedDate:String{
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        print(" selected Date ::\(datePicker.date)")
        data = datePicker.date
        return formatter.string(from: datePicker.date)
    }
    
    var formmattedTime:String{
        get{
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter.string(from: datePicker.date)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if showTimePicker {
            lbl_titleLabel.text = "Select Time"
            datePicker.datePickerMode = .time
            btn_saveButton.setTitle("Set Time", for: .normal)
            datePicker.preferredDatePickerStyle = .wheels
        }else{
            lbl_titleLabel.text = "Select Date"
            datePicker.datePickerMode = .date
            btn_saveButton.setTitle("Set Date", for: .normal)
            datePicker.preferredDatePickerStyle = .wheels

        }
        
    }

    
    @IBAction func btn_saveDateAction(_ sender: Any) {
        
        NotificationCenter.default.post(name: .savedDateTime, object: datePicker.date)
        
        if showTimePicker {
            onSave?(formattedDate)
        }
        else{
            onSave?(formmattedTime)
        }
        deleagte?.popupValueSelected(value: "Selected String")
        dismiss(animated: true)
    }
    
    deinit {
        print("Datepopviewcontroller memory released ")
    }
    
    
    
    
    
    
    
    
    
    
    
    

}











































































