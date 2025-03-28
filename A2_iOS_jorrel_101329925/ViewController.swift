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
    
    var products: [Product]?
    
    var currentIndex = 0
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let context = appDelegate.persistentContainer.viewContext
        
        if checkForFirst(context) == false {
            let firstProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
            firstProduct.setValue("Mac", forKey: "name")
            firstProduct.setValue("First Product", forKey: "desc")
            firstProduct.setValue(500.0, forKey: "price")
            firstProduct.setValue("Apple", forKey: "provider")
            
            appDelegate.saveContext()
        }
    }
    
    func fetchData() {
        
        products = [Product]()
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            products = try context.fetch(request)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func checkForFirst(_ context: NSManagedObjectContext) -> Bool {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Product")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
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

