//
//  OrangeViewController.swift
//  LifeCycleViewController
//

import UIKit

class OrangeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        printMessage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printMessage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printMessage()
    }
    
    // Вызывается перед тем, как вью будет скрыта
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        printMessage()
    }
    
    // Срабатывает после скрытия вью
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        printMessage()
    }
    
    // Вызывается когда вью выгружается из памяти
    deinit {
        printMessage()
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true)
    }

}
