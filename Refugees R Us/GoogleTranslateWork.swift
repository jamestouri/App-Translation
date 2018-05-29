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
    

    
    func makingRequests(spoken_text: String?, toTranslate: String?, source: String?) -> String? {
        
        var result =  [String: String]()
        
        let parameters = [
            "q": spoken_text,
            "target": toTranslate,
//            "key": API_KEY,
            "source": source
            ]
        
        Alamofire.request("https://translation.googleapis.com/language/translate/v2?key=\(API_KEY)", method: .post, parameters: parameters)
            .responseJSON { (response) in
              
                if let json = response.result.value {
                    print(json)
//                    result = json as! [String : String]
                    
                }
        }
        return result["translations"]
    }
    
}

