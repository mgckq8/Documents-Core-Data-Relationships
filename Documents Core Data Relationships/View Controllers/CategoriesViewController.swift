//
//  CategoriesViewController.swift
//  Documents Core Data Relationships
//
//  Created by Melissa Crozier on 10/2/20.
//  Copyright © 2020 Melissa Crozier. All rights reserved.
//

import UIKit

class DocCategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    var categories = [Category]()
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Categories"
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
