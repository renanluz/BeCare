//
//  ResultViewController.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var hospitals: [Hospital] = [
        Hospital(name: "Cruz Azul", address: "Rua 10"),
        Hospital(name: "Santa Casa", address: "Rua 55"),
        Hospital(name: "HB", address: "Rua 11")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "ResultCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        // Do any additional setup after loading the view.
    }
}


extension ResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hospitals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ResultCell
        
        cell.nameLabel.text = hospitals[indexPath.row].name
        cell.addressLabel.text = hospitals[indexPath.row].address
        
        return cell
    }
}

extension ResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(hospitals[indexPath.row].address)
    }
}
