//
//  RealmViewController.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 25.11.2020.
//

import UIKit
import RealmSwift

class FeedbackItem: Object {
    @objc dynamic var name = ""
    @objc dynamic var feedback = ""
    @objc dynamic var id: ObjectId = ObjectId.generate()
    
    convenience init(name: String, feedback: String, id: String) {
        self.init()
        self.name = name
        self.feedback = feedback
    }
    override static func primaryKey() -> String {
        return "id"
    }
}

class RealmViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    let mike =  FeedbackItem(name: "Mike", feedback: "Best app for food delivery", id: "0")
    var feedback = try! Realm().objects(FeedbackItem.self).sorted(byKeyPath: "name", ascending: true)
    var realm = try! Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        if realm.isEmpty {
            try! realm.write() {
                realm.add(mike)
            }
        }
        let path = realm.configuration.fileURL?.path
        print("Path - \(String(describing: path))")
        
    }
    

    // MARK: - Button to add feedback
    
    @IBAction func addFeedbackButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Write feedback", message: "", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {
            alert -> Void in
            let nameField = alertController.textFields![0] as UITextField
            let feedbackField = alertController.textFields![1] as UITextField
            
            let newFeedback = FeedbackItem(name: nameField.text!, feedback: feedbackField.text!, id: "")
            
            try! self.realm.write {
                self.realm.add(newFeedback)
                self.tableView.reloadData()
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addTextField(configurationHandler: {
            (nameField: UITextField!) -> Void in
            nameField.placeholder = "Your name"
        })
        alertController.addTextField(configurationHandler: {
            (feedbackField: UITextField!) -> Void in
            feedbackField.placeholder = "Your feedback about us :)"
        })
        self.present(alertController, animated: true)
    }
    
    
}

// MARK: - Delegate

extension RealmViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == UITableViewCell.EditingStyle.delete{
//            feedback!.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//        }
//    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editingRow = feedback[indexPath.row]
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") {_,_ in
            try! self.realm.write {
                self.realm.delete(editingRow)
                tableView.reloadData()
            }
        }
        return [deleteAction]
    }
}


// MARK: - DataSource

extension RealmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedback.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = feedback[indexPath.row].name
        cell.detailTextLabel?.text = feedback[indexPath.row].feedback
        
        return cell
    }
    
    
}
