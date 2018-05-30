//
//  TranslatorViewController.swift
//  Refugees R Us
//
//  Created by James touri on 5/26/18.
//  Copyright © 2018 jamestouri. All rights reserved.
//

import UIKit
import Alamofire

class TranslatorViewController: UIViewController {
    
    @IBOutlet weak var translateToLabel: UILabel!
    
    // The translated Language
    var languageToTranslate: String!
    
    // Translated 2-char String
    var translatedIdentifier: String?
    
    // getting list of the language choices and translating them to the proper text
    var translateChoice = ViewController().languageChoices

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        translatePicker.delegate = self
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var translatePicker: UIPickerView!
    
   
    
}


extension TranslatorViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return translateChoice.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var translated: String?
        let translate = TranslateRequests()
        // If the language that wants to be translated to is equivalent return the same text
        if languageIdentifier == translateChoice[Array(translateChoice.keys)[row]] {
            
            return Array(translateChoice.keys)[row]
       
        } else {
            // Call the Google Translate API
            translate.makingRequests(spoken_text: Array(translateChoice.keys)[row], toTranslate: languageIdentifier, source: translateChoice[Array(translateChoice.keys)[row]]) { (completionHandler: String?) in
                    self.TranslatorViewController.reloadAllComponent()
                    translated = completionHandler
                
                }
        }
        return translated
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
}
