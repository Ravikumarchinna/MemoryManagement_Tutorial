//
//  ViewController.swift
//  MemoryManagement_Tutorial
//
//  Created by Ravikumar on 05/01/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lbl_Name: UILabel!
    
    
    @IBAction func btn_sendNotifiAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let closureVC = storyboard.instantiateViewController(identifier: "CloseresMemoryRelease_VC") as! CloseresMemoryRelease_VC
        self.navigationController?.pushViewController(closureVC, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //... Start Value Type
        var firstName = "Kumar"
        let lastName = "Kumar"
        
        let fullName = firstName+lastName
        firstName = "Ravikumar"
        //... End Value Type
        
        lbl_Name.text = "Ravikumar"
        
        
        //...Start Reference Type
        //...Here reference count is 3 and releasing the memory
        //        var first:MyClass? = MyClass()
        //        var second = first
        //        var third = second
        //
        //        first = nil
        //        second = nil
        //        third = nil
        //...End Reference Type

        
        //...Start Removing memory from Child and Parent classes
        //...With no strong reference
        var mom:Parent? = Parent()
        mom = nil
        
        
        //...Make Strong references of two classes
        
        var joe:Person? = Person()
        var dev:Job? = Job()
        
        joe?.Job = dev
        dev?.person = joe
        
        joe = nil
        dev = nil
        
        
        //... NotificationCenter memory problems
        NotificationCenter.default.post(name: Notification.Name("sampleNotify"), object: nil)

        
        
    }

}

//...Start Removing memory from Child and Parent classes
//...With no strong reference
class Child {
    
    deinit {
        print("Deallocating child")
    }
}

class Parent {
    var child = Child()// Dependent .Depends on Parent . Owner:Parent
    deinit {
        print("Deallocating Parent")
    }
}
//...End Removing memory from Child and Parent classes



//...Start Reference Type Example class
class MyClass {
    
    var myInt:Int = 8
    deinit {
        print("MyClass will be deallocated")
    }
    
}

//...Strong References classes eachother(Problems Removing(Deallocating) from Memory)

class Job {
    var person:Person?
    deinit {
        print("Job will be deallocated")
    }
}

class Person {
   weak var Job:Job?
    deinit {
        print("Person will be deallocated")
    }
}
//...Strong References classes eachother(Problems Removing(Deallocating) from Memory)















































































