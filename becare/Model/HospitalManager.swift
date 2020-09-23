//
//  Hospital.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import Foundation

protocol HospitalManagerDelegate {
    func didUpdateHospital(_ hospitalManager: HospitalManager, hospital: HospitalModel)
    func didFailWithErro(error: Error)
}

struct HospitalManager {
    let hospitalURL = "https://becare-api.azurewebsites.net/api/hospitais/listar-ios/"
    
    var delegate: HospitalManagerDelegate?
    
    var hospitals = [HospitalModel]()
    
    
    func fetchHospital(text: String) {
        let urlString = "\(hospitalURL)\(text)"
        performRequest(with: urlString)
        print(urlString)
        
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithErro(error: error!)
                    return
                }
                if let safeData = data {
                    if let hospital = self.parseJSON(safeData){
                        self.delegate?.didUpdateHospital(self, hospital: hospital)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ hospitalData: Data) -> HospitalModel? {
        let decoder = JSONDecoder()
        do {
       let decodedData = try decoder.decode(HospitalData.self, from: hospitalData)
            let nome = decodedData.hospitais[0].nome
            let endereco = decodedData.hospitais[0].logradouro
            let lat = decodedData.hospitais[0].latitude
            let lon = decodedData.hospitais[0].longitude
            let tel = decodedData.hospitais[0].telefone
            let fila = decodedData.hospitais[0].fila
            
            
            let hospital = HospitalModel(nome: nome, telefone: tel, logradouro: endereco, longitude: lon, latitude: lat, fila: fila)
            
             //print(decodedData.hospitais[0].nome)
            
            return hospital
        } catch {
            delegate?.didFailWithErro(error: error)
            return nil
        }
    }
}
