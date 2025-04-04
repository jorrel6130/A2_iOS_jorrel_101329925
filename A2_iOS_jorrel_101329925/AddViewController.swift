//
//  AddViewController.swift
//  A2_iOS_jorrel_101329925
//
//  Created by Jorrel Tigbayan on 2025-03-28.
//

import UIKit
import CoreData

class AddViewController: UIViewController {
    
    @IBOutlet var textInputs: [UITextField]!
    
    var products: [Product]?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        let name = textInputs[0].text ?? ""
        let desc = textInputs[1].text ?? ""
        let price = Float(textInputs[2].text!) ?? 0.0
        let provider = textInputs[3].text ?? ""
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let product = Product(context: context)
        product.name = name
        product.desc = desc
        product.price = price
        product.provider = provider
        
        products?.append(product)
        
        appDelegate.saveContext()
    }

}

