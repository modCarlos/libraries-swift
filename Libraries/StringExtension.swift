//
//  StringExtension.swift
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

import Foundation

extension String {
    
    ///Permite solo numeros
    func onlyNumbersInPhone( string : String) -> String {
        return string.replacingOccurrences(of: "\\D", with: "", options: .regularExpression, range: string.startIndex ..< string.endIndex)
    }
    
    ///Para dar formato de numero telefonico
    func formatPhoneNumber(simpleNumberPhone : String, deleteLastChar : Bool) -> String {
        
        if simpleNumberPhone.characters.count == 0 {
            return ""
        }
        
        var simpleNumber = simpleNumberPhone
        
        let regex = try! NSRegularExpression(pattern: "[\\s-\\(\\)]", options: .caseInsensitive)
        simpleNumber = regex.stringByReplacingMatches(in: simpleNumber, options: NSRegularExpression.MatchingOptions(rawValue: UInt(0)),
                                                      range: NSRange(location: 0, length: simpleNumber.characters.count), withTemplate: "")
        
        //Range
        let start = simpleNumber.index(simpleNumber.startIndex, offsetBy: 0)
        let toTen = simpleNumber.index(simpleNumber.startIndex, offsetBy: 9)
        
        if simpleNumber.characters.count > 10 {
            simpleNumber = simpleNumber.substring(to: toTen)
        }
        
        let minusOne = simpleNumber.index(simpleNumber.startIndex, offsetBy: simpleNumber.characters.count - 2)
        
        if deleteLastChar {
            simpleNumber = simpleNumber.substring(to: minusOne)
        }
        
        let end = simpleNumber.index(simpleNumber.startIndex, offsetBy: simpleNumber.characters.count - 1)
        
        if simpleNumber.characters.count < 7 {
            simpleNumber = simpleNumber.replacingOccurrences(of: "(\\d{2})(\\d+)", with: "($1) $2",
                                                             options: .regularExpression, range: start..<end)
        }else {
            simpleNumber = simpleNumber.replacingOccurrences(of: "(\\d{2})(\\d{4})(\\d+)", with: "($1) $2 $3",
                                                             options: .regularExpression, range: start..<end)
        }
        
        return simpleNumber
    }
    
    func index(of string: String) -> String.Index? {
        return range(of: string)?.upperBound
    }
    
    ///Obtiene los ultimos 10 digitos de un telefono
    func getLast10(phone : String) -> String {
        
        if phone.characters.count <=  10 {
            return phone
        }
        
        return phone.substring(from: phone.index(phone.endIndex, offsetBy: -10))
    }
}
