//
//  ContactsExtension.swift
//  Libraries
//
//  Created by Carlos Fuentes on 06/02/17.
//  Copyright © 2017 Carlos Fuentes. All rights reserved.
//

import Foundation
import AddressBook
import AddressBookUI

extension NSObject {

    ///Para versiones abajo de ios 8.0
    func getContactsInPhone(_ addressBook: ABAddressBook) -> ([[Contact]],[String]) {
        var contacts = [[Contact]]()
        var auxiliarTitleIndex = [String]()
        
        let allPeople = ABAddressBookCopyArrayOfAllPeopleInSourceWithSortOrdering(addressBook, nil, ABPersonSortOrdering(kABPersonSortByLastName)).takeRetainedValue() as NSArray
        
        //Indextable
        var temporalCharacter : Character!
        var temporalArray = [Contact]()
        
        for i in 0  ..< allPeople.count {
            let person = allPeople[i] as ABRecord
            if (ABRecordCopyValue(person,kABPersonLastNameProperty) != nil) {
                if let lastNameAB = ABRecordCopyValue(person,kABPersonLastNameProperty) {
                    let lastName = lastNameAB.takeRetainedValue() as! String
                    if lastName != "" {
                        let chara = lastName.characters.first
                        if chara != temporalCharacter {
                            temporalCharacter = lastName.characters.first!
                            auxiliarTitleIndex.append(String(temporalCharacter))
                            contacts.append(temporalArray)
                            temporalArray = [Contact]()
                        }
                    }                    }
            }else {
                if let record = ABRecordCopyCompositeName(person) {
                    let fullN = record.takeRetainedValue() as String
                    if fullN != "" {
                        let chara = fullN.characters.first
                        if chara != temporalCharacter {
                            temporalCharacter = fullN.characters.first!
                            auxiliarTitleIndex.append(String(temporalCharacter))
                            contacts.append(temporalArray)
                            temporalArray = [Contact]()
                        }
                    }
                }
            }
            
            if let recordFN = ABRecordCopyCompositeName(person) {
                let fullName : String   = recordFN.takeRetainedValue() as String
                var name : String       = ""
                var lastName : String   = ""
                var lastNameM : String  = ""
                var image : UIImage?
                let phonesArray         = NSMutableArray.init()
                
                //name
                if let record = ABRecordCopyValue(person, kABPersonFirstNameProperty) {
                    name = record.takeRetainedValue() as! String
                }
                
                //lastname
                if let record = ABRecordCopyValue(person, kABPersonLastNameProperty) {
                    lastName = record.takeRetainedValue() as! String
                }
                
                //lastname materno
                if let record = ABRecordCopyValue(person, kABPersonMiddleNameProperty) {
                    lastNameM = record.takeRetainedValue() as! String
                }
                
                //Image
                if ABPersonHasImageData(person) {
                    image = UIImage(data: ABPersonCopyImageData(person).takeRetainedValue() as Data)
                }
                
                //Phones
                if let pRef = ABRecordCopyValue(person, kABPersonPhoneProperty) {
                    let phonesMultivalueRef = pRef.takeRetainedValue()
                    
                    if Int(ABMultiValueGetCount(phonesMultivalueRef)) > 0 {
                        for j in 0 ..< ABMultiValueGetCount(phonesMultivalueRef) {
                            var labelStringRef = ""
                            
                            if let ref = ABMultiValueCopyLabelAtIndex(phonesMultivalueRef, j) {
                                labelStringRef = ref.takeRetainedValue() as String
                                labelStringRef = labelStringRef.replacingOccurrences(of: "_$!<", with: "")
                                labelStringRef = labelStringRef.replacingOccurrences(of: ">!$_", with: "")
                            }
                            var phoneNumber = ABMultiValueCopyValueAtIndex(phonesMultivalueRef, j).takeRetainedValue() as! String
                            if phoneNumber.onlyNumbersInPhone(string: phoneNumber).characters.count > 10 {
                                phoneNumber = phoneNumber.onlyNumbersInPhone(string: phoneNumber)
                                phoneNumber = phoneNumber.getLast10(phone: phoneNumber)
                                phoneNumber = phoneNumber.formatPhoneNumber(simpleNumberPhone: phoneNumber, deleteLastChar: false)
                            }
                            phonesArray.add(["number" : phoneNumber, "label" : labelStringRef])
                        }
                    }else {
                        continue
                    }
                }
                temporalArray.append(Contact(name: name, lastName: lastName, lastNameM: lastNameM, phones: phonesArray, image: image, id: 0, fullName: fullName))
            }
            
            
        }
        
        contacts.append(temporalArray)
        return (contacts,auxiliarTitleIndex)
    }
}
