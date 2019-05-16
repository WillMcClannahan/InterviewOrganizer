//
//  Note+CoreDataClass.swift
//  Notes
//
//  Created by Dale Musser on 4/9/19.
//  Copyright © 2019 Tech Innovator. All rights reserved.
//
//

import UIKit
import CoreData


@objc(Note)
public class Note: NSManagedObject {
    var addDate: Date? {
        get {
            return rawAddDate as Date?
        }
        set {
            rawAddDate = newValue as NSDate?
        }
    }
    
    convenience init?(title: String, body: String) {
        // note: UIKit is needed to access UIApplication (see import above)
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext, title != "" else {
                return nil
        }
        
        self.init(entity: Note.entity(), insertInto: managedContext)
        self.title = title
        self.body = body
        self.addDate = Date(timeIntervalSinceNow: 0)
    }
}
