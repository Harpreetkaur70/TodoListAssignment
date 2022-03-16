//
//  ToDoTableViewController.swift
//  TodoListAssignment
//
//  Created by user205769 on 3/16/22.
//

import UIKit
import CoreData
class ToDoTableViewController: UITableViewController {

    var persistentContainer: NSPersistentContainer!
    
    var tasks = [TodoTask]()
    override func viewDidLoad() {
        super.viewDidLoad()
           // Uncomment the following line to preserve selection between presentations
         

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBAction func Edit(_ sender: Any) {//Editig Toogle Button
        if isEditing{
            (sender as AnyObject).setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
            
        }else{
            (sender as AnyObject).setTitle("Done", for: .normal)
            setEditing(true, animated: true)
            
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let request: NSFetchRequest<TodoTask> = TodoTask.fetchRequest()
        let moc = persistentContainer.viewContext

        guard
            let results = try? moc.fetch(request)
        else {return}

        tasks = results

        tableView.reloadData()
     
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    //asigning text into tableView cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDo", for: indexPath)
        let title = tasks[indexPath.row].title
        cell.textLabel?.text = title
        
        // Configure the cell...

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Segue created for tableView
        let context = NSManagedObjectContext()
        if editingStyle == .delete {
            // Delete the row from the data source
            if let Value = tasks[indexPath.row] as? NSManagedObject {
                             context.delete(Value)  //Deleting row from Core Data
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addTask = segue.destination as? AddTaskViewController {
            addTask.persistentContainer = persistentContainer
        }
       
    }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

