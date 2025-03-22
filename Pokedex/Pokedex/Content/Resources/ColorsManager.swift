//
//  ManajadorColores.swift
//  Pokedex
//
//  Created by FranaGan on 21/12/24.
//
import UIKit
import SwiftUI

enum Colors: String {
    case azul
    case amarillo
    case marron
    case blanco
    case rojoPokebola
    
}
    
    extension Colors {
        var value: UIColor {
            guard let color = UIColor.init(named: self.rawValue) else { return .clear }
            return color
        }
    }

let azul = Colors.azul.rawValue
let amarillo = Colors.amarillo.rawValue
let marron = Colors.marron.rawValue
let blanco = Colors.blanco.rawValue
let rojoPokebola = Colors.rojoPokebola.rawValue
