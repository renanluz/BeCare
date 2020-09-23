//
//  Hospital.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import Foundation

struct HospitalModel: Codable {
    let nome: String
    let telefone: String
    let logradouro: String
    let longitude: Double
    let latitude: Double
    let fila: String
    
}
