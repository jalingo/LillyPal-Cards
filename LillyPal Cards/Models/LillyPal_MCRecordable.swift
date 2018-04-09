//
//  LillyPal MCRecordable.swift
//  LillyPal Cards
//
//  Created by James Lingo on 4/6/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import CloudKit
import MagicCloud
import UIKit

struct LillyPalKeys {
    static let recordType = "LillyPal"
    
    static let name = "Name"
    static let body = "Body"
    static let mind = "Mind"
    static let social = "Social"
    static let health = "Health"
    static let image = "Image"
    
    struct Images {
        static let bullyBoyBob = "bob"
        static let coolKittyKate = "kate"
        static let quickRick = "rick"
        static let snifflingSteve = "steve"
        static let vpYavno = "yavno"
    }
}

extension LillyPal: MCRecordable, ImageConverter {
    var recordType: String { return LillyPalKeys.recordType }
    
    var recordFields: Dictionary<String, CKRecordValue> {
        get {
            var dictionary = [String: CKRecordValue]()
            
            dictionary[LillyPalKeys.name] = self.name as CKRecordValue
            dictionary[LillyPalKeys.body] = self.body as CKRecordValue
            dictionary[LillyPalKeys.mind] = self.mind as CKRecordValue
            dictionary[LillyPalKeys.social] = self.social as CKRecordValue
            dictionary[LillyPalKeys.health] = self.health as CKRecordValue
            if let str = convert(self.portrait) { dictionary[LillyPalKeys.image] = str as CKRecordValue }
            
            return dictionary
        }
        
        set {
            if let str = newValue[LillyPalKeys.name] as? String { self.name = str }
            if let num = newValue[LillyPalKeys.body] as? NSNumber { self.body = num.intValue }
            if let num = newValue[LillyPalKeys.mind] as? NSNumber { self.mind = num.intValue }
            if let num = newValue[LillyPalKeys.social] as? NSNumber { self.social = num.intValue }
            if let num = newValue[LillyPalKeys.health] as? NSNumber { self.health = num.intValue }
            if let str = newValue[LillyPalKeys.image] as? String,
                let img = convert(str) {
                self.portrait = img
            }
            
        }
    }
}
