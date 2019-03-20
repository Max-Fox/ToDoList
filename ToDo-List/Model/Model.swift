//
//  Model.swift
//  ToDo-List
//
//  Created by Максим Лисица on 17/03/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import UIKit

var pathForSaveData: String {
    let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] + "/data.plist"
    
    //print(path)
    
    return path
}

var rootItem: ToDoItem?


func loadData(){
    if let dict = NSDictionary(contentsOfFile: pathForSaveData) {
        rootItem = ToDoItem(dictionary: dict)
    } else {
        rootItem = ToDoItem(name: "ToDo")
    }
    
    
}
func saveData(){
    if let rootItem = rootItem {
    rootItem.dictionary.write(toFile: pathForSaveData, atomically: true)
        
        
    UIApplication.shared.applicationIconBadgeNumber = rootItem.countUncopletedSubTask
    }
    if enableBadges{
        UIApplication.shared.applicationIconBadgeNumber = rootItem!.countUncopletedSubTask
    } else {
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
    
    
}
var enableBadges: Bool {
    set {
        UserDefaults.standard.set(newValue, forKey: "enableBadges")
        UserDefaults.standard.synchronize()
    } get {
        return UserDefaults.standard.bool(forKey: "enableBadges")
        
    }
}

