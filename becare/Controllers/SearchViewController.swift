//
//  SearchViewController.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit
import CoreLocation

class SearchViewController: UIViewController {
    
    var searchs: [Search] = [
        Search(text: "Hospital 1"),
        Search(text: "Hospital 2"),
        Search(text: "Hospital 3")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    
    let hosptialManager = HospitalManager()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        searchTextField.delegate = self
        
        
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
}

//MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! SearchCell
        
        cell.label.text = searchs[(indexPath.row)].text
        
        return cell
    }
}

//MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        searchTextField.text = searchs[(indexPath.row)].text
    }
}

//MARK: - UITextFieldDelegate

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Digite algo"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
     if let search = searchTextField.text {
        hosptialManager.fetchHospital(text: search)
     }
     searchTextField.text = ""
     }
}

//MARK: - CLLocationManagerDelegate

extension SearchViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
           let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            
            print(lat)
            print(lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
