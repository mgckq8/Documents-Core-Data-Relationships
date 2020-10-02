//
//  DocumentsViewController.swift
//  Documents Core Data Relationships
//
//  Created by Melissa Crozier on 10/2/20.
//  Copyright © 2020 Melissa Crozier. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController {

    @IBOutlet weak var documentsTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
        
    }
    override func viewWillAppear(_ animated: Bool) {
            self.documentsTableView.reloadData()
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated. // dispose of any
        }
        
        @IBAction func addNewExpense(_ sender: Any) {
            performSegue(withIdentifier: "showExpense", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let destination = segue.destination as? NewDocumentViewController else {
                return
            }
            destination.category = category
        }
        
        func deleteExpense(at indexPath: IndexPath) {
            guard let expense = category?.documents?[indexPath.row],
                let managedContext = expense.managedObjectContext else {
                    return
            }
            managedContext.delete(expense)
            
            do {
                try managedContext.save()
                documentsTableView.deleteRows(at: [indexPath], with: .automatic)
            } catch {
                print("Could not delete expense")
                
                documentsTableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }

    extension DocumentsViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return category?.documents?.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = documentsTableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
            if let expense = category?.documents?[indexPath.row] {
                cell.textLabel?.text = expense.name
                if let date = expense.date {
                    cell.detailTextLabel?.text = dateFormatter.string(from: date)
                }
            }
            
            return cell
        }
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                deleteExpense(at: indexPath)
            }
        }
    }

    extension DocumentsViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showExpense", sender: self)
        }
    }


