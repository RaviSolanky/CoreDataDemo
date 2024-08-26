//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by semidot on 22/08/24.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func saveTapped(_ sender: UIButton) {
        
        if txtName.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            // Display an alert
            showAlert(msg: "Name should not be blank.")
        } else if txtAge.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true {
            // Display an alert
            showAlert(msg: "Age should not be blank.")
        }
        
        else {
            // Proceed with your code when the text is not empty
           // print("Text field is not empty.")
            
            self.createPerson(name: txtName.text ?? "", age: 20)
            
        }
   
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        return textField.resignFirstResponder()
    }
    
    func showAlert(msg: String) {
            let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
     }
    
    func createPerson(name: String, age: Int16) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newPerson = Person(context: context)
        newPerson.name = name
        newPerson.age = age
        
        do {
            try context.save()
        } catch {
            print("Failed to save person: \(error)")
        }
    }

}

