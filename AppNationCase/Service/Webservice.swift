//
//  Webservice.swift
//  AppNationCase
//
//  Created by M Kaan Adanur on 26.01.2022.
//

import Foundation
import UIKit

class Webservice{
    
    func getData(url:URL, completion: @escaping(Space?) -> Void){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR 1")
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                let result = try? JSONDecoder().decode(Space.self, from: data)
                    if let result = result{
                        SpaceViewModel.sharedInstance = result
                   }
                    completion(result)
            }
            
        }.resume()
        
    }
    

    
}
