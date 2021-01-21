//
//  Contact.swift
//  promobitTest
//
//  Created by Camilo Oscar Girardelli Baptista on 21/01/21.
//

import Foundation
import UIKit

class Contact:NSObject, Decodable{

    var avatar:String?
    var company : String?
    var createdAt : String?
    var custom_note : String?
    var email : String?
    var id : String?
    var name : String?
    var phone : String?
    var website : String?

    init(avatar:String,company:String,createdAt:String,custom_note:String,email:String, id:String, name:String, phone:String, website:String) {
        self.avatar = avatar
        self.company = company
        self.createdAt = createdAt
        self.custom_note = custom_note
        self.email = email
        self.id = id
        self.name = name
        self.phone = phone
        self.website = website
    }
}
