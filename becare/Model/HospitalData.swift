//
//  HospitalData.swift
//  becare
//
//  Created by Renan Luz on 22/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import Foundation

struct HospitalData: Codable {
    let hospitais: [Hospital]
}

struct Hospital: Codable {
    let id: Int
    let nome: String
    let telefone: String
    let logradouro: String
    let cep: String
    let sus: Bool
    let publico: Bool
    let longitude: Double
    let latitude: Double
}

