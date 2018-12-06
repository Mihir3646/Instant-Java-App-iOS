//
//  HelperClass.swift
//  Instant Java
//
//  Created by Aaliya Khan on 13/08/17.
//  Copyright © 2017 abhishekbihani. All rights reserved.
//

import UIKit

class HelperClass
{
    class func setValSharedPerf(key:String, value:String){
        
        let preferences = UserDefaults.standard
        preferences.set(String (value), forKey: key)
        preferences.synchronize()
    }

    class func getValSharedPrefObj(key:String)-> String{
        
        let preferences = UserDefaults.standard
        var value:String = ""
        if preferences.object(forKey: key) == nil {
            value = ""
        } else {
            
            value = preferences.object(forKey: key) as! String        }
        
        return value
    }
    
   class func removeSpecialChars(str:String) -> String{
        
//        let charSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789").invertedSet
//        let cleanedString = str.componentsSeparatedByCharactersInSet(charSet).joinWithSeparator("")
//        
//        return cleanedString
    let okayChars : Set<Character> =
                Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".characters)
           return String(str.characters.filter {okayChars.contains($0) })
    
    
    }
    
//   class func removeSpecialChars(str: String) -> String {
//        let okayChars : Set<Character> =
//            Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".characters)
//        return String(str.characters.filter {okayChars.contains($0) })
//    }


}
