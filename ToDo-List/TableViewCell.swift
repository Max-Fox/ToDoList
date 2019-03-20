//
//  TableViewCell.swift
//  ToDo-List
//
//  Created by Максим Лисица on 17/03/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelSubItems: UILabel!
    @IBOutlet weak var buttonCheck: UIButton!
    
    @IBAction func pushCheckAction(_ sender: Any) {
        toDoInCell?.changeState()
        
        setCheckButton()
        saveData()
    }
    
    func setCheckButton()  {
        if toDoInCell!.isComplete {
            buttonCheck.setImage(UIImage(named: "check.jpg"), for: UIControl.State.normal)
            
        } else {
            buttonCheck.setImage(UIImage(named: "uncheck.jpg"), for: UIControl.State.normal)
        }
        
        saveData()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var toDoInCell: ToDoItem?
    func initCell(toDo: ToDoItem){
        toDoInCell = toDo
        labelName.text = toDoInCell?.name
        labelSubItems.text = toDoInCell?.subItemsText
    }

}
