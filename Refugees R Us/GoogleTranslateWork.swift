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
    

    
    func makingRequests(spoken_text: String?) -> String? {
        
        var result: String?
        
        let parameters = [
            "q": spoken_text,
            "source": "",
            "target": "",
            "format": "text"
            ] as [String : Any]
        
        Alamofire.request("https://translation.googleapis.com/language/translate/v2?key=\(apiKey)", method: .post, parameters: parameters)
            .responseJSON { response in
                print(response.request)
                print(response.response)
                print(response.data)
                print(response.result)
                
                result = response.result.value as! String
        }
        return result ?? "Error"
    }
    
}

