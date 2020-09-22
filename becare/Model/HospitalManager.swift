//
//  Hospital.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import Foundation

struct HospitalManager {
    let hospitalURL = "https://becare-api.azurewebsites.net/api/Hospitais/listar/"
    
    func fetchHospital(text: String) {
        let urlString = "\(hospitalURL)\(text)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(hospitalData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(hospitalData: Data) {
        let decoder = JSONDecoder()
        do {
       let decodedData = try decoder.decode(HospitalData.self, from: hospitalData)
        
        } catch {
            print(error)
            print("deu ruim")
        }
    }
}
