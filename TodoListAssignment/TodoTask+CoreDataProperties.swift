//
//  TodoTask+CoreDataProperties.swift
//  TodoListAssignment
//
//  Created by user205769 on 3/16/22.
//
//

import Foundation
import CoreData


extension TodoTask {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoTask> {
        return NSFetchRequest<TodoTask>(entityName: "TodoTask")
    }

    @NSManaged public var title: String?
    @NSManaged public var date: Date?

}

extension TodoTask : Identifiable {

}
