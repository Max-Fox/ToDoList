//
//  SettingsController.swift
//  ToDo-List
//
//  Created by Максим Лисица on 20/03/2019.
//  Copyright © 2019 Максим Лисица. All rights reserved.
//

import UIKit

class SettingsController: UITableViewController {

   
    @IBAction func pushDoneAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var switchEnablesBadges: UISwitch!
    @IBAction func switchEnabledBadgesAction(_ sender: Any) {
        enableBadges = switchEnablesBadges.isOn
        
        if switchEnablesBadges.isOn {
            let settings = UIUserNotificationSettings(types: [.badge], categories: nil)
            UIApplication.shared.registerUserNotificationSettings(settings)
        }
        
        saveData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        switchEnablesBadges.isOn = enableBadges
    }

    

}
