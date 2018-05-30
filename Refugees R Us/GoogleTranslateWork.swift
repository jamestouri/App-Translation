//
//  GoogleTranslateWork.swift
//  Refugees R Us
//
//  Created by James touri on 5/26/18.
//  Copyright © 2018 jamestouri. All rights reserved.
//

import Foundation
import Alamofire



class TranslateRequests {
    
    private var API_KEY = "AIzaSyDciQUmZujriTIx_DaSeE-5WYu6kCCc9XA"
//    var result: String?

    
    func makingRequests(spoken_text: String?, toTranslate: String?, source: String?, completionHandler: @escaping (String?) -> ()) {
        

        let parameters = [
            "q": spoken_text!,
            "target": toTranslate!,
            "source": source!
            ]
        
        
        Alamofire.request("https://translation.googleapis.com/language/translate/v2?key=\(API_KEY)", method: .post, parameters: parameters)
            .responseJSON { (response) in
              
                if let json = response.result.value as? [String: Any]  {
                    if let data = json["data"] as? [String: Any]  {
                        if let translations = data["translations"] as? [NSDictionary]  {
                            if let translated = translations.first as? [String: Any] {
//
//                                (translated["translatedText"] as! String)
//                                print(self.result)
                                completionHandler(translated["translatedText"] as? String)
                                
                                
                            }
                        }
                    }
                }
            }
//        return result
    }
    
}

