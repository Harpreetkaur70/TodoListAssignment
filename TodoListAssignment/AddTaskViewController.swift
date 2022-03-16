//
//  ViewController.swift
//  TodoListAssignment
//
//  Created by user205769 on 3/16/22.
//

import UIKit
import CoreData
class AddTaskViewController: UIViewController {
    
    
    var persistentContainer: NSPersistentContainer!
    
    
    @IBOutlet weak var titletext: UITextField!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var addtask: UIButton!
    
    @IBAction func addtask(_ sender: Any) {
    
        let moc = persistentContainer.viewContext
    
    moc.perform {
        let tasks = TodoTask(context: moc)
        tasks.title = self.titletext.text
        tasks.date = self.datepicker.date
        
        do {
            try moc.save()
        } catch {
            moc.rollback()
        }
      }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


}

