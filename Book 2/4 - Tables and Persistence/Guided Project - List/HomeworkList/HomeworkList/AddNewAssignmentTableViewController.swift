//
//  AddNewAssignmentTableViewController.swift
//  HomeworkList
//
//  Created by Student on 2020-06-03.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit

class AddNewAssignmentTableViewController: UITableViewController {

    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var subjectSegmentedControl: UISegmentedControl!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var isCompleteButton: UIButton!
    @IBOutlet var dueDateDetailLabel: UILabel!
    @IBOutlet var dueDatePickerView: UIDatePicker!
    @IBOutlet var notesTextView: UITextView!
    
    var homework: Homework?
    
    var isPickerHidden = true
    
    let dateLabelIndexPath = IndexPath(row: 0, section: 2)
    let datePickerIndexPath = IndexPath(row: 1, section: 2)
    let notesTextViewIndexPath = IndexPath(row: 0, section: 3)
    
    let normalCellHeight: CGFloat = 44
    let largeCellHeight: CGFloat = 200
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        if let homework = homework {
            navigationItem.title = "Homework"
            loadSubject(subject: homework.subject)
            titleTextField.text = homework.title
            isCompleteButton.isSelected = homework.isComplete
            dueDatePickerView.date = homework.dueDate
            notesTextView.text = homework.notes
        } else {
            dueDatePickerView.date = Date().addingTimeInterval(24*60*60)
        }

        updateSaveButtonState()
        updateDueDateLabel(date: dueDatePickerView.date)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case datePickerIndexPath:
            return isPickerHidden ? 0 : dueDatePickerView.frame.height
        case notesTextViewIndexPath:
            return largeCellHeight
        default:
            return normalCellHeight
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath {
            isPickerHidden = !isPickerHidden
            dueDateDetailLabel.textColor = isPickerHidden ? .black : tableView.tintColor
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        titleTextField.resignFirstResponder()
    }

    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected = !isCompleteButton.isSelected
    }
    
    @IBAction func dueDatePickerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: dueDatePickerView.date)
    }
    
    func loadSubject(subject: Subject) {
        switch subject {
        case .physics:
            subjectSegmentedControl.selectedSegmentIndex = 0
        case .english:
            subjectSegmentedControl.selectedSegmentIndex = 1
        case .co_op:
            subjectSegmentedControl.selectedSegmentIndex = 2
        }
    }
    
    func chooseSubject(subjectIndex: Int) -> Subject {
        if subjectIndex == 0 {
            return .physics
        } else if subjectIndex == 1 {
            return .english
        } else {
            return .co_op
        }
    }
    
    func updateSaveButtonState() {
        let text = titleTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    func updateDueDateLabel(date: Date) {
        dueDateDetailLabel.text = Homework.dueDateFormatter.string(from: date)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let subject = chooseSubject(subjectIndex: subjectSegmentedControl.selectedSegmentIndex)
        let title = titleTextField.text!
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePickerView.date
        let notes = notesTextView.text
        
        homework = Homework(subject: subject, title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    

    
    /*
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
