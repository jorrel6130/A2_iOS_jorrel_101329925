//
//  ViewController.swift
//  A2_iOS_jorrel_101329925
//
//  Created by Jorrel Tigbayan on 2025-03-27.
//

import UIKit

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let context = appDelegate.persistentContainer.viewContext
    }


}

