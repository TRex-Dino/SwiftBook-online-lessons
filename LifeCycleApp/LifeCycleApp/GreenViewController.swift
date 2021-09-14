//
//  GreenViewController.swift
//  LifeCycleViewController
//

import UIKit

class GreenViewController: UIViewController {
    
    @IBOutlet var openThirdVC: UIButton! {
        didSet {
            print(openThirdVC.currentTitle ?? "nil")
        }
    }
    
    var someProperties: String! {
        didSet {
            print(someProperties ?? "nil")
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        printMessage()
    }
    
    /*
    override func loadView() {
        
    }
    */
    
    // Вызывается после загрузки View в память
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "GreenVC"
        printMessage()
    }
    
    // Вызывается перед появленем вью
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printMessage()
    }
    
    // Вызывается при расстановке констрейнтов
    override func updateViewConstraints() {
        printMessage()
        super.updateViewConstraints()
    }
    
    // Вызывается перед расстановкой всех элементов на экране
    override func viewWillLayoutSubviews() {
        printMessage()
    }
    
    // Тут срабатывает Auto Layout
    
    
    // Вызывается после расстановки всех элементов на экране
    override func viewDidLayoutSubviews() {
        printMessage()
    }
    
    // Вызывается после появления вью на экране
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printMessage()
    }
    
    // Вызывается при изменении размеров вью
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        printMessage()
    }
    
    // Вызывается перед скрытием вью
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printMessage()
    }
    
    // Вызывается после скрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printMessage()
    }
}

extension UIViewController {
    func printMessage(function: String = #function) {
        print("\(title ?? ""): \(function)")
    }
}
