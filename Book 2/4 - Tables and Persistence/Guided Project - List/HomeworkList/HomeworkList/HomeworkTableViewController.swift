//
//  ToDoTableViewController.swift
//  ToDoList
//
//  Created by Student on 2020-06-03.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class HomeworkTableViewController: UITableViewController, HomeworkCellDelegate {
    
    var homeworkList = [Homework]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        if let savedHomework = Homework.loadHomework() {
            homeworkList = savedHomework
        } else {
            homeworkList = Homework.loadSampleHomework()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkList.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "homeworkCellIdentifier", for: indexPath) as? HomeworkCell else {
            fatalError("Could not dequeue cell")
        }
        
        cell.delegate = self
        let homework = homeworkList[indexPath.row]
        if homework.subject == .physics {
            cell.titleLabel?.text = "Physics - \(homework.title)"
        } else if homework.subject == .english {
            cell.titleLabel?.text = "English - \(homework.title)"
        } else {
            cell.titleLabel?.text = "Co-Op - \(homework.title)"
        }
        cell.isCompleteButton.isSelected = homework.isComplete

        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            homeworkList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Homework.saveHomework(homeworkList)
        }
    }
    
    func checkmarkTapped(sender: HomeworkCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var homework = homeworkList[indexPath.row]
            homework.isComplete = !homework.isComplete
            homeworkList[indexPath.row] = homework
            tableView.reloadRows(at: [indexPath], with: .automatic)
            Homework.saveHomework(homeworkList)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editHomework", let navController = segue.destination as? UINavigationController, let addNewAssignmentTableViewController = navController.topViewController as? AddNewAssignmentTableViewController {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedHomework = homeworkList[indexPath.row]
            addNewAssignmentTableViewController.homework = selectedHomework
        }
    }
    
    @IBAction func unwindToHomeworkList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddNewAssignmentTableViewController
        
        if let homework = sourceViewController.homework {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                homeworkList[selectedIndexPath.row] = homework
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: homeworkList.count, section: 0)
                homeworkList.append(homework)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        Homework.saveHomework(homeworkList)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
