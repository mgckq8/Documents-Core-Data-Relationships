//
//  Document+CoreDataClass.swift
//  Documents Core Data Relationships
//
//  Created by Melissa Crozier on 10/2/20.
//  Copyright © 2020 Melissa Crozier. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate? as Date?
        }
    }
    
    convenience init?(name: String?, content: String?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext, let name = name, name != ""  else {
            return nil
        }
        
        self.init(entity: Document.entity(), insertInto: context)
        
        self.name = name
        self.content = content
        self.rawDate = Date(timeIntervalSinceNow: 0);
        self.category = category
        
        if let size = content?.count {
            self.size = Int64(size)
        } else {
            self.size = 0
        }
        
        
    }
}
