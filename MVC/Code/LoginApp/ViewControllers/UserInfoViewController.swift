//
//  UserInfoViewController.swift
//  LoginApp
//
//  Created by Dmitry on 29.09.2021.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    private let moreInfoButton = UIButton(type: .roundedRect)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = user.person.fullName
        setupButton()
    }
    
    private func setupButton() {
        moreInfoButton.setTitle("More info", for: .normal)
        moreInfoButton.setTitleColor(.blue, for: .normal)
        moreInfoButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        moreInfoButton.addTarget(self, action: #selector(moreInfoButtonClicked), for: .touchUpInside)
        
        moreInfoButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(moreInfoButton)
        NSLayoutConstraint.activate([
            moreInfoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moreInfoButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            moreInfoButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc private func moreInfoButtonClicked() {
        navigationController?.pushViewController(ImageViewController(), animated: true)
    }
}
