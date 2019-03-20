//
//  ToDoItem.swift
//  ToDo-List
//
//  Created by Максим Лисица on 17/03/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import UIKit

class ToDoItem {
    var name: String
    var isComplete: Bool
    
    var subItems: [ToDoItem]
    
    var subItemsText: String {
        if subItems.count == 0 {
            return ""
        }
        
        var completetodoCount: Int = 0
        for todo in subItems{
            if todo.isComplete {
                completetodoCount += 1
            }
        }
        
        if completetodoCount == 0 {
            return String(subItems.count) + " subitems"
        } else {
            return String(subItems.count) + " subitems / " + String(completetodoCount) + " complete"
        }
        
        
        
    }
    var countUncopletedSubTask: Int {
        var uncompletetodoCount: Int = 0
        for todo in subItems{
            if !todo.isComplete {
                uncompletetodoCount += 1
            }
        }
        return uncompletetodoCount
    }
    init(name: String) {
        self.name = name
        self.isComplete = false
        
        self.subItems = []
    }
    init(dictionary: NSDictionary) {
        self.name = dictionary.object(forKey: "name") as! String
        self.isComplete = dictionary.object(forKey: "isComplete") as! Bool
        
        self.subItems = []
        
        let arraySubToDos = dictionary.object(forKey: "subtodos") as! NSArray
        for subtodoDict in arraySubToDos{
            self.subItems.append(ToDoItem(dictionary: subtodoDict as! NSDictionary))
        }
        
    }
    var dictionary: NSDictionary {
        var arraySubToDos = NSArray()
        
        for subitem in subItems {
            arraySubToDos = arraySubToDos.adding(subitem.dictionary) as NSArray
        }
        
        let dictionary = NSDictionary(objects: [name, isComplete, arraySubToDos], forKeys: ["name" as NSCopying,"isComplete" as NSCopying, "subtodos" as NSCopying])
        
        return dictionary
    }
    
    func addSubItem(subItem: ToDoItem) {
        subItems.append(subItem)
    }
    func removeSubItem(index: Int) {
        subItems.remove(at: index)
    }
    
    func changeState(){
        isComplete = !isComplete
        
    }
}
