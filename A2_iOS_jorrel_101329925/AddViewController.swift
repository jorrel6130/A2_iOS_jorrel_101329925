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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        
        
        saveData()
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

