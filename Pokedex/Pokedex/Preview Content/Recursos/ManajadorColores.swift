//
//  ManajadorColores.swift
//  Pokedex
//
//  Created by InnoTest-iOS on 21/12/24.
//
import UIKit
import SwiftUI

enum Colors: String {
   case azulPastel
    case amarilloPastel
    
}
    
    extension Colors {
        var value: UIColor {
            guard let color = UIColor.init(named: self.rawValue) else { return .clear }
            return color
        }
    }

let azulPastel = Colors.azulPastel.rawValue
let amarilloPastel = Colors.amarilloPastel.rawValue
