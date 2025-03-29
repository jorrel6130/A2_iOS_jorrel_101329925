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
    
    @IBOutlet weak var searchName: UITextField!
    
    var products: [Product]?
    
    var currentIndex: Int = 0
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let context = appDelegate.persistentContainer.viewContext
        
        if checkForFirst(context) == false {
            let firstProduct = NSEntityDescription.insertNewObject(forEntityName: "Product", into: context)
            firstProduct.setValue("Mac", forKey: "name")
            firstProduct.setValue("First Product", forKey: "desc")
            firstProduct.setValue(499.99, forKey: "price")
            firstProduct.setValue("Apple", forKey: "provider")
            
            appDelegate.saveContext()
        }
        
        fetchData()
        
        currentIndex = 0
        
        updateLabels()
    }
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let previousView = sender.source as? AddViewController {
            fetchData()
            products = previousView.products
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let productAdd = segue.destination as? AddViewController
        fetchData()
        productAdd?.products = products
        
        let productTable = segue.destination as? TableViewController
        fetchData()
        productTable?.products = products
    }
    
    @IBAction func searchByName(_ sender: UIButton) {
        for (index, product) in products!.enumerated() {
            let productName = product.value(forKey: "name") as? String
            let productDesc = product.value(forKey: "desc") as? String
            let query = searchName.text ?? ""
            if query == productName {
                print("Index: \(index) Name: \(productName ?? "")")
                currentIndex = index
                print(currentIndex)
                updateLabels()
                return
            } else if (productDesc!.contains(query)) {
                print("Index: \(index) Name: \(productName ?? "")")
                currentIndex = index
                print(currentIndex)
                updateLabels()
                return
            }
            
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        if (products!.count > currentIndex + 1) {
            currentIndex = currentIndex + 1
            print(currentIndex)
        }
        updateLabels()
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        if (currentIndex - 1 >= 0) {
            currentIndex = currentIndex - 1
            print(currentIndex)
        }
        updateLabels()
    }
    
    
    func updateLabels() {
        let product = products?[currentIndex]
        
        let price = product!.value(forKey: "price")
        let priceString = ("$\(price ?? 0.0)")
        
        nameLabel.text = product!.value(forKey: "name") as? String
        descLabel.text = product!.value(forKey: "desc") as? String
        priceLabel.text = priceString
        providerLabel.text = product!.value(forKey: "provider") as? String
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

}

