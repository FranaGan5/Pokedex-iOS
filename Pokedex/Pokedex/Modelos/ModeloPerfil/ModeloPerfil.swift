//
//  PerfilModel.swift
//  Pokedex
//
//  Created by FranaGan on 3/12/24.
//

import Foundation

struct ModeloPerfil: Identifiable{
    let id = UUID()
    let emoji: String
    let nombre: String
    let descripcion: String
}
let lista: [ModeloPerfil] = [
    ModeloPerfil(
           emoji: "📱",
           nombre: "Teléfono",
           descripcion: "Persona que levanta la mano para preguntar."),
    ModeloPerfil(
           emoji: "✉️",
           nombre: "Email",
           descripcion: "El aguacate es un fruto exótico carnoso que se obtiene del árbol tropical del mismo nombre. En algunas partes de América del Sur se conoce como Palta.."),
    ModeloPerfil(
           emoji: "🏠",
           nombre: "Dirección",
           descripcion: "Comida chatarra creada en Italia."),
    ModeloPerfil(
           emoji: "🪪",
           nombre: "DNI",
           descripcion: "Los rompecabezas o puzzles son piezas comúnmente planas que combinadas correctamente forman una figura, un objeto o una escena. ... Por diversión, entretenimiento o como una forma de relajarse"),
    ModeloPerfil(
           emoji: "👨🏽‍🌾",
           nombre: "Alias",
           descripcion: "Estatua ubicada en Nuva York."),
    
]
