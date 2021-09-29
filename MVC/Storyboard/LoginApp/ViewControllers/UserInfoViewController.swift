//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Alexey Efimov on 02.04.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.person.fullName
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        imageVC.user = user
    }
}
