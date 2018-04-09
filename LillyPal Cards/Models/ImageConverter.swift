//
//  ImageConverter.swift
//  LillyPal Cards
//
//  Created by James Lingo on 4/6/18.
//  Copyright © 2018 Escape Chaos. All rights reserved.
//

import UIKit

protocol ImageConverter { }

extension ImageConverter {
    
    func convert(_ image: UIImage) -> String? {
        if image == #imageLiteral(resourceName: "bully_boy_bob") { return LillyPalKeys.Images.bullyBoyBob }
        if image == #imageLiteral(resourceName: "cool_kitty_cat") { return LillyPalKeys.Images.coolKittyKate }
        if image == #imageLiteral(resourceName: "Quick_rick") { return LillyPalKeys.Images.quickRick }
        if image == #imageLiteral(resourceName: "steve") { return LillyPalKeys.Images.snifflingSteve }
        if image == #imageLiteral(resourceName: "Wakil_kepala_yavno") { return LillyPalKeys.Images.vpYavno }
        
        return nil
    }
    
    func convert(_ str: String) -> UIImage? {
        if str == LillyPalKeys.Images.bullyBoyBob { return #imageLiteral(resourceName: "bully_boy_bob") }
        if str == LillyPalKeys.Images.coolKittyKate { return #imageLiteral(resourceName: "cool_kitty_cat") }
        if str == LillyPalKeys.Images.quickRick { return #imageLiteral(resourceName: "Quick_rick") }
        if str == LillyPalKeys.Images.snifflingSteve { return #imageLiteral(resourceName: "steve") }
        if str == LillyPalKeys.Images.vpYavno { return #imageLiteral(resourceName: "Wakil_kepala_yavno") }
        
        return nil
    }
}
