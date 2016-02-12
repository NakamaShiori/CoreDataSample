//
//  DataStore.swift
//  CoreDataSample
//
//  Created by N on 2016/02/11.
//  Copyright © 2016年 Nakama. All rights reserved.
//

import UIKit
import CoreData

class DataStore: NSManagedObject {
    
    @NSManaged var date: NSDate?
    @NSManaged var text: String?

}
