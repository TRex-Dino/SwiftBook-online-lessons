//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Dmitry on 17.09.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var user: User!
    var delegate: SettingNewValuesDelegate!
    
    private let welcomeLabel = UILabel()
    private let logoutButton = UIButton(type: .system)
    
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = "Welcome, \(user.person.fullName)!"
        setupWelcomeLabel()
        setupLogOutButton()
    }
    
    private func setupWelcomeLabel() {
        welcomeLabel.textColor = .white
        welcomeLabel.font = UIFont.systemFont(ofSize: 14)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    private func setupLogOutButton() {
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.setTitleColor(.white, for: .normal)
        logoutButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        logoutButton.addTarget(self, action: #selector(logoutButtonClicked), for: .touchUpInside)
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 30),
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.widthAnchor.constraint(equalToConstant: 100),
            logoutButton.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    @objc private func logoutButtonClicked() {
        delegate.setNewValues(userValue: "", passwordValue: "")
        dismiss(animated: true, completion: nil)
    }
}
