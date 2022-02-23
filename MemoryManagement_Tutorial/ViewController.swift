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
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UpdateAccepted"), object: self)

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
        
        //... Reference type memory identifying , only single reference will point back to the all which are accessing from this
        //        var myint = MyInt()
        //        print(" \(myint.int)")
        //        var myint1 = myint
        //        myint1.int = 4
        //        print("\(myint1.int)")
        //        print(" \(myint.int)")
        //
        //... Value Type memory finding
        //        var str = "name"
        //        var lastname = str
        //        lastname = "kumar"
        //
        //        print("\(str)")
        //        print("\(lastname)")
        
        
        
        
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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















































































