//
//  ViewController.swift
//  A2_iOS_jorrel_101329925
//
//  Created by Jorrel Tigbayan on 2025-03-27.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let context = appDelegate.persistentContainer.viewContext
        
        let firstProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
        firstProduct.setValue("Mac", forKey: "name")
        firstProduct.setValue("First Product", forKey: "desc")
        firstProduct.setValue(500.0, forKey: "price")
        firstProduct.setValue("Apple", forKey: "provider")
        
        appDelegate.saveContext()
    }


}

