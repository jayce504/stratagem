//
//  addClientViewController.swift
//  Stratagem
//
//  Created by Scott Hudson on 6/3/17.
//  Copyright © 2017 Hudson Legal Services PLLC. All rights reserved.
//

import UIKit

class addClientViewController: UIViewController, UIImagePickerControllerDelegate {
    @IBOutlet var nameField: UITextField!
    @IBOutlet var addressField: UIStackView!
    @IBOutlet var phoneNumberField: UITextField!
    @IBOutlet var appOrRetField: UITextField!
    @IBOutlet var bondField: UITextField!
    @IBOutlet var crimesField: UITextView!
    @IBOutlet var clientImage: UIImageView!
    @IBAction func addClientButton(_ sender: Any) {
    
        let casesObject = UserDefaults.standard.object(forKey: "cases")
        
        var cases: [String]
        
        if let tempCases = casesObject as? [String] {
            
            cases = tempCases
            
            cases.append(nameField.text!)
            
        } else {
            
            cases = [nameField.text!]
            
        }
        
        UserDefaults.standard.set(cases, forKey: "cases")
        
        nameField.text = " "
        
        //and now to add the crimes too
        

        //let crimesObject = UserDefaults.standard.object(forKey: "crimes")
    
        //var crimes: [String]
    
        //if let tempCrimes = crimesObject as? [String] {
        
        //crimes = tempCrimes
        
        //crimes.append(nameField.text!)
        
        //} else {
    
        //crimes = [crimesField.text!]
    
        }
    
        //UserDefaults.standard.set(cases, forKey: "crimes")
    
        //crimesField.text = " "
        
    //}
    

    @IBAction func clientCameraButton(_ sender: Any) {
    
        let imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            imagePicker.sourceType = .camera
            
        } else {
            
            imagePicker.sourceType = .photoLibrary
            
        }
        
    
        imagePicker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        //imagePicker.modalPresentationStyle = .popover
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        dismiss(animated: true, completion: nil)
        
        clientImage.image = image
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
    }


