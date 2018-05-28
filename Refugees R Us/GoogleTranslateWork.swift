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
    
    private var apiKey = "AIzaSyDciQUmZujriTIx_DaSeE-5WYu6kCCc9XA"
    

    
    func makingRequests(spoken_text: String?, toTranslate: String?) -> String? {
        
        var result =  [String: String]()
        
        let parameters = [
            "q": spoken_text,
            "target": toTranslate,
            "format": "text"
            ] as! [String : String]
        
        Alamofire.request("https://translation.googleapis.com/language/translate/v2?key=\(apiKey)", method: .post, parameters: parameters)
            .responseJSON { (response) -> Void in
              
                if let json = response.result.value {
                    result = json as! [String : String]
                }
        }
        return result["translations"] as! String
    }
    
}

