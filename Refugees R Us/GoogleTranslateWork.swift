//
//  GoogleTranslateWork.swift
//  Refugees R Us
//
//  Created by James touri on 5/26/18.
//  Copyright © 2018 jamestouri. All rights reserved.
//

import Foundation
import Alamofire
import AVFoundation



class TranslateRequests {
    
    private var API_KEY = "KEY HERE"
//    var result: String?

    // Translating a string
    func makingRequests(spoken_text: String?, toTranslate: String.SubSequence?, source: String.SubSequence?, completionHandler: @escaping (String?) -> ()){
        
        
        let parameters = [
            "q": spoken_text!,
            "target": toTranslate!,
            "source": source!
            ] as [String : Any]
        
        Alamofire.request("https://translation.googleapis.com/language/translate/v2?key=\(API_KEY)", method: .post, parameters: parameters)
            .responseJSON { (response) in
              
                if let json = response.result.value as? [String: Any]  {
                    if let data = json["data"] as? [String: Any]  {
                        if let translations = data["translations"] as? [NSDictionary]  {
                            if let translated = translations.first as? [String: Any] {
//
//
                                completionHandler(translated["translatedText"] as? String)
                                
                                
                            }
                        }
                    }
                }
            }
    }
    
    
    
    func speechToText(encoding: URL?, languageCode: String?, completionHandler: @escaping (String?) -> ()) {
        
        let parameters = [
            "audio": ["content": encoding! ],
             "config": ["encoding": "LINEAR16",
                         "sampleRateHertz": 16000,
                         "languageCode": languageCode!
                ]
        
            ] as [String : Any]
        
        
        Alamofire.request("https://speech.googleapis.com/v1/speech:recognize?key=\(API_KEY)", method: .post, parameters: parameters)
            .responseJSON { (response) in
                if let json = response.result.value as? [String: Any] {
                    completionHandler(json as? String)
//                    print(completionHandler)
                }
        }
    }
    
    
    
}

