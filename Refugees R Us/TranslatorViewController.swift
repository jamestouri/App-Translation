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
    var languageToTranslate: String?
    
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
        DispatchQueue.global().async {
            let translate = TranslateRequests()
            
            var translated = translate.makingRequests(spoken_text: Array(self.translateChoice.keys)[row], toTranslate: ViewController().languageIdentifier)
        }
        return Array(translateChoice.keys)[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
}
