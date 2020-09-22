//
//  ResultViewController.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBAction func searchButtonPressed(_ sender: UIButton) {
 
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var hospitals: [HospitalModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadHospital()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func loadHospital() {
        guard let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") else { return }
        do {
        
            let data = try Data(contentsOf: fileURL)
            hospitals = try JSONDecoder().decode([HospitalModel].self, from: data)
            
        } catch  {
            print(error.localizedDescription)
        }
        
    }
}


extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ResultCell
        
        cell.nameLabel.text = hospitals[indexPath.row].nome
        cell.addressLabel.text = hospitals[indexPath.row].logradouro
        
        return cell
    }
}

extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(hospitals[indexPath.row].address)
    }
}
