//
//  ViewController.swift
//  TODOList
//
//  Created by Ibrahim Aitkazin on 28.05.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addTast(_ sender: Any) {
        
        let newTask = TaskItem()
        newTask.task = textTextFiled.text!
        textTextFiled.text = ""
        let defualts = UserDefaults.standard
        
        
        //defualts.removeObject(forKey: "taskArray")
        
        do {
            if let data = defualts.data(forKey: "taskArray") {
                
                var array = try JSONDecoder().decode([TaskItem].self, from: data)
                array.append(newTask)
                
                let encodedData = try JSONEncoder().encode(array)
                
                defualts.set(encodedData, forKey: "taskArray")

            }else {
                let encodedData = try JSONEncoder().encode([newTask])
                defualts.set(encodedData, forKey: "taskArray")
            }
                
        } catch{
            print("Unable to encode data \(error)")
        }
       /*
        if let array = defualts.array(forKey: "taskArray"){
        
            var taskarray: [String] = array as! [String]
            //taskarray.append(newTask)
            defualts.set(taskarray,forKey: "taskArray")
        
        }else{
            defualts.set([newTask], forKey: "taskArray")
        }
        */
        
    }
    
}

