//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Dmitry on 16.09.2021.
//

import UIKit

protocol SettingNewValuesDelegate {
    func setNewValues(userValue: String, passwordValue: String)
}

class LoginViewController: UIViewController {
    private let logInButton = UIButton(type: .roundedRect)
    
    private let userNameTextField = UITextField()
    private let passwordTextField = UITextField()
    
    private let forgotNameButton = UIButton(type: .roundedRect)
    private let forgotPasswordButton = UIButton(type: .roundedRect)
    
    private let user = User.getUserData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 247/255, alpha: 1)
        
        setupViews()
        addConstraints()
    }
    
    //MARK: - setup constraints
    private func addConstraints() {
        let stackView = UIStackView(arrangedSubviews: [
            userNameTextField, passwordTextField
        ])
        stackView.axis = .vertical
        stackView.distribution = UIStackView.Distribution.equalSpacing
        //        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing = 8
        
        let stackView2 = UIStackView(arrangedSubviews: [
        forgotNameButton, forgotPasswordButton
        ])
        stackView2.distribution = .equalSpacing
        stackView2.spacing = 16
        
        let stackView3 = UIStackView(arrangedSubviews: [
        stackView, logInButton, stackView2
        ])
        stackView3.axis = .vertical
        stackView3.distribution = UIStackView.Distribution.equalSpacing
        //        stackView3.alignment = UIStackView.Alignment.center
        stackView3.spacing = 16
        
        view.addSubview(stackView3)
        
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView3.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView3.widthAnchor.constraint(equalToConstant: view.frame.width - 80)
        ])
    }

    //MARK: - setup views
    private func setupViews() {
        userNameTextField.placeholder = "Enter your name"
        userNameTextField.borderStyle = .roundedRect
        userNameTextField.delegate = self
        userNameTextField.returnKeyType = .next
        userNameTextField.autocorrectionType = .no
        
        passwordTextField.placeholder = "Enter password"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        passwordTextField.returnKeyType = .done
        
        logInButton.setTitle("Log In", for: .normal)
        logInButton.setTitleColor(.blue, for: .normal)
        logInButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        logInButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        
        forgotNameButton.setTitle("Forgot User Name?", for: .normal)
        forgotNameButton.setTitleColor(.blue, for: .normal)
        forgotNameButton.addTarget(self, action: #selector(forgotNameClicked), for: .touchUpInside)
        
        forgotPasswordButton.setTitle("Forgot Password", for: .normal)
        forgotPasswordButton.setTitleColor(.blue, for: .normal)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordClicked), for: .touchUpInside)
        
        
    }
    
    //MARK: - buttons action
    @objc private func loginButtonClicked() {
        if userNameTextField.text != user.login || passwordTextField.text != user.password {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return
        }
        //push to next screen
        setUpTabBarControllers()
    }
    
    private func setUpTabBarControllers() {
        let welcomeVC = WelcomeViewController()
        let navVC = UINavigationController(rootViewController: UserInfoViewController())
        let tabBarController = UITabBarController()
        welcomeVC.user = user
        let topVC = navVC.topViewController as! UserInfoViewController
        topVC.user = user
        
        tabBarController.viewControllers = [welcomeVC, navVC]
        tabBarController.modalPresentationStyle = .fullScreen
        
        let welcomItem = UITabBarItem()
        welcomItem.title = "Home"
        welcomItem.image = UIImage(systemName: "person.fill")
        welcomeVC.tabBarItem = welcomItem
        
        let userItem = UITabBarItem()
        userItem.title = "Info"
        userItem.image = UIImage(systemName: "info.circle")
        topVC.tabBarItem = userItem
        
        welcomeVC.delegate = self
        show(tabBarController, sender: nil)
    }
    
    @objc private func forgotPasswordClicked() {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
    
    @objc private func forgotNameClicked() {
        showAlert(title: "Oops!", message: "Your name is \(user.login) 😉")
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work with keyboard
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            loginButtonClicked()
        }
        return true
    }
}

extension LoginViewController: SettingNewValuesDelegate {
    func setNewValues(userValue: String, passwordValue: String) {
        userNameTextField.text = userValue
        passwordTextField.text = passwordValue
    }
    
    
}
