//
//  SpaceViewModel.swift
//  AppNationCase
//
//  Created by M Kaan Adanur on 27.01.2022.
//

import Foundation

struct SpaceViewModel{
    
   
    static var sharedInstance = Space(name: "", links: Links(patch: Patch(small: "", large: "")))
    
}

extension SpaceViewModel{
    func convertDateFromUnix(dateUnix: Double) -> String{
        let date = Date(timeIntervalSince1970: dateUnix)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm"
        let strDate = dateFormatter.string(from: date)
        return strDate
    }
}

extension SpaceViewModel{
    
    var name: String{
        return SpaceViewModel.sharedInstance.name
        
    }
    
    var detail: String{
        
        if SpaceViewModel.sharedInstance.details == nil{
            return "Detail info is not found"
        }else{
            return SpaceViewModel.sharedInstance.details!
        }
    }
    
    var flighNumber: String{
        
        if SpaceViewModel.sharedInstance.flight_number == nil{
            return "Flight number info not found."
        }else{
            return String(describing: SpaceViewModel.sharedInstance.flight_number!)
        }
        
       
    }
    
    var date: String{
        
        if SpaceViewModel.sharedInstance.date_unix == nil{
            return "Date info is not found."
        }else{
            
            return SpaceViewModel().convertDateFromUnix(dateUnix: SpaceViewModel.sharedInstance.date_unix!)
            
        }
        
       
    }
    
    var patchSmall: String{
        return SpaceViewModel.sharedInstance.links.patch.small
    }
    
    var patchLarge: String{
        return SpaceViewModel.sharedInstance.links.patch.large
    }
    
    var webcast: String?{
        if SpaceViewModel.sharedInstance.links.webcast == nil{
            return nil
        }else{
            return SpaceViewModel.sharedInstance.links.webcast!
        }
    }
    
    var wikipedia: String?{
        
        if SpaceViewModel.sharedInstance.links.wikipedia == nil{
            return nil
        }else{
            return SpaceViewModel.sharedInstance.links.wikipedia!
        }
    }
    
    
    
}
