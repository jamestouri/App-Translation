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
    
    
    // getting list of the language choices and translating them to the proper text
    var translateChoice = ViewController().languageChoices
    
    // Appending to the new list
    var dictList: Array = [AnyObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        translatePicker.delegate = self
        translatePicker.dataSource = self
        
        
        let translate = TranslateRequests()
        // If the language that wants to be translated to is equivalent return the same text
        for i in (0 ..< translateChoice.count) {
            if languageIdentifier == translateChoice[Array(translateChoice.keys)[i]] {
                
               continue
                
            } else {
                
                // Call the Google Translate API
                translate.makingRequests(spoken_text: Array(self.translateChoice.keys)[i], toTranslate: languageIdentifier, source: translateChoice[Array(translateChoice.keys)[i]]) { ( completionHandler: String?) in
                    
                    DispatchQueue.main.async {
                        self.dictList.append(completionHandler as AnyObject)
                        self.translatePicker.reloadAllComponents()
                    }
                }
            }
        }
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
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
        return dictList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dictList[row] as! String
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
}
