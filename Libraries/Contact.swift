//
//  Contact.swift
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

import Foundation
import UIKit

class Contact {
    var fullName : String! // Este es por comodidad
    var name: String!
    var lastName : String!
    var lastNameM : String!
    var id : Int!
    var phones: NSMutableArray?
    var image: UIImage?
    
    init(name: String, phones: NSMutableArray?, image: UIImage?, id: Int) {
        self.name   = name
        self.phones = phones
        self.image  = image
        self.id     = id
    }
    
    init(name: String, lastName: String, lastNameM: String, phones: NSMutableArray?, image: UIImage?, id: Int, fullName : String) {
        self.name   = name
        self.lastName = lastName
        self.lastNameM = lastNameM
        self.phones = phones
        self.image  = image
        self.id     = id
        
        self.fullName = fullName
    }
    
    func compareContacts(contactL : Contact, contactR : Contact) -> Bool {
        return contactL.name == contactR.name &&
            contactL.phones == contactR.phones &&
            contactL.image == contactR.image;
    }
    
    func orderFavoriteContacts(contacts : [[Contact]]) {
        print("Ordering...")
    }
    
    func checkIfFavoriteExists(contact : Contact, favorites : [[Contact]]) -> Bool {
        if favorites.count == 0 {
            return false
        }
        
        var j = 0
        for entry : [Contact] in favorites {
            var i = 0
            for contactTemp : Contact in entry {
                if contact.compareContacts(contactL: contactTemp, contactR: contact) {
                    print("Se encontro uno igual")
                    return true
                }
                i = i+1
            }
            j = j+1
        }
        return false
    }
}
