//
//  ViewController.swift
//  Refugees R Us
//
//  Created by James touri on 5/26/18.
//  Copyright © 2018 jamestouri. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    // Language that will be associated with the Google Translate API
    var language_chosen: String?
    
    // Identified 2-Char String for Google Translate API
    var languageIdentifier: String?
    
    
    // Languages to choose from
    let languageChoices = ["عربى": "ar",
                           "Nederlands": "nl",
                           "English": "en",
                           "Magyar": "hu",
                           "Deutsche": "ge",
                           "Ελληνικά": "el",
                           "Italiano": "it",
                           "Lietuviškai": "lt",
                           "Tagalog": "tl",
                           "Türk": "tr",
                           "Українська": "uk"
                           ]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Getting list of different languages that Google Translate supports
       
        
        language_select.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        
    }
    
    
    
    // Selection of Languages
    @IBOutlet weak var language_select: UIPickerView!
    
    

}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languageChoices.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Array(languageChoices.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        language_chosen = Array(languageChoices.keys)[row]
        languageIdentifier = languageChoices[language_chosen!]
        print(languageIdentifier as! String)
        
    }
}
