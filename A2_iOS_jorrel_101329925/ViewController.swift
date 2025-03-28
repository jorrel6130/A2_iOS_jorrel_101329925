//
//  ViewController.swift
//  A2_iOS_jorrel_101329925
//
//  Created by Jorrel Tigbayan on 2025-03-27.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    
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
    
    @objc func saveData() {
        let context = appDelegate.persistentContainer.viewContext
        do {
            try context.save()
        } catch {
            print("Failed to save: \(error.localizedDescription)")
        }
    }


}

