//
//  YellowViewController.swift
//  LifeCycleViewController
//
import UIKit

class YellowViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! GreenViewController
        dvc.someProperties = "someProperties"
    }

}

