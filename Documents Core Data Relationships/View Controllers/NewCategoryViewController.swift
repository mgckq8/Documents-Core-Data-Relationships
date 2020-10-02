//
//  NewCategoryViewController.swift
//  Documents Core Data Relationships
//
//  Created by Melissa Crozier on 10/2/20.
//  Copyright © 2020 Melissa Crozier. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {


    @IBOutlet weak var titleTextField: UITextField!
    
        override func viewDidLoad() {
            super.viewDidLoad()

//            titleTextField.delegate = self
            
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            titleTextField.resignFirstResponder()
        }
        
        @IBAction func saveCategory(_ sender: Any) {
            guard let category = Category(title: titleTextField.text ?? "") else {
                return
            }
            
            do {
                try category.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Could not save category")
            }
            
        }
    }

    extension NewCategoryViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
