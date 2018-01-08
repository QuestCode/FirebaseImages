//
//  Structs.swift
//  To-Do List
//
//  Created by Devontae Reid on 12/21/17.
//  Copyright © 2017 Devontae Reid. All rights reserved.
//

import UIKit
import FirebaseFirestore

class Todo: Codable {
    var title: String
    var isComplete: Bool = false
    var dueDate: Date
    var numOfHoursRequired: Int
    var description: String?
    
    init(title: String,dueDate: Date,numOfHoursRequired: Int,description: String?) {
        self.title = title
        self.dueDate = dueDate
        self.numOfHoursRequired = numOfHoursRequired
        self.description = description
    }
    
    init(document: DocumentSnapshot) {
        let title = document.data()["title"] as? String
        let description = document.data()["description"] as? String
        let hours = document.data()["hoursNeeded"] as? Int
        let dueDate = document.data()["due_date"] as? Date
        let completed = document.data()["completed"] as? Bool
        
        self.title = title!
        self.dueDate = dueDate!
        self.numOfHoursRequired = hours!
        self.description = description
        self.isComplete = completed!
        
    }
    
    
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = DocumentsDirectory.appendingPathComponent("todos.plist")
    
    static func saveTodos(_ todos: [Todo]) {
        let db = Firestore.firestore()
        for todo in todos {
            
            let dict: [String: Any] = ["title":todo.title,
                                       "due_date":todo.dueDate,
                                       "hoursNeeded":todo.numOfHoursRequired,
                                       "description":todo.description!,
                                       "completed":todo.isComplete]
            db.collection("todos").addDocument(data: dict)
        }
    }
    
    static func loadTodos() -> [Todo]? {
        let todos = [Todo]()
        let db = Firestore.firestore()
        db.collection("todos").order(by: "due_date", descending: false).getDocuments { (response, error) in
            if error != nil {
                print(error)
            } else {
                for document in (response?.documents)! {
                    let todo = Todo(document: document)
                }
            }
        }
        return todos
    }
    
    static func loadSampleTodos() -> [Todo] {
        return [
            Todo(title: "Contact Bern",dueDate: Date(),numOfHoursRequired: 8, description: "Talk about programming in Swift"),
            Todo(title: "Research Swift Designs",dueDate: Date(),numOfHoursRequired: 5, description: "Find some inspiration!"),
            Todo(title: "Daily Quote",dueDate: Date(),numOfHoursRequired: 10, description: "I am extraordinarily patient, provided I get my own way in the end.\n -Margaret Thatcher"),
            Todo(title: "Find more projects to do",dueDate: Date(),numOfHoursRequired: 2, description: "I need more iOS projects."),
            Todo(title: "UIStepper Designs",dueDate: Date(),numOfHoursRequired: 4, description: "Look up UIStepper designs to start")
        ]
    }
    
}

