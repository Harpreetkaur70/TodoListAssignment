//
//  AddTaskViewController.swift
//  TodoListAssignment
//
//  Created by user205769 on 3/17/22.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
    var persistentContainer: NSPersistentContainer!
    @IBOutlet weak var datepicker: UIDatePicker!
    @IBOutlet weak var tasktext: UITextField!
        @IBAction func savebtn(_ sender: Any) {
    
        let moc = persistentContainer.viewContext
    
    moc.perform {
        let tasks = TodoTask(context: moc)
        tasks.date = self.datepicker.date
        tasks.title = self.tasktext.text  // getting title input from the user
        
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
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
