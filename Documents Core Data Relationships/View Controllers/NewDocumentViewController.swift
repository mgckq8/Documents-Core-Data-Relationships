//
//  NewDocumentViewController.swift
//  Documents Core Data Relationships
//
//  Created by Melissa Crozier on 10/2/20.
//  Copyright © 2020 Melissa Crozier. All rights reserved.
//

import UIKit

class NewDocumentViewController: UIViewController {
      
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
        var document: Document?
        var category: Category?
        
        override func viewDidLoad() {
            super.viewDidLoad()

            if let document = document {
                let name = document.name
                nameTextField.text = name
                contentTextView.text = document.content
                title = name
            }
            
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            nameTextField.resignFirstResponder()
            contentTextView.resignFirstResponder()
        }
        
        @IBAction func save(_ sender: Any) {
            
            let name = nameTextField.text
            let content = contentTextView.text
            
            if let document = Document(name: name, content: content) {
                category?.addToRawDocuments(document)
                
                do {
                    try document.managedObjectContext?.save()
                    self.navigationController?.popViewController(animated: true)
                } catch {
                    print("Document could not be created")
                }
            }
            
        }
    }

    extension NewDocumentViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }
