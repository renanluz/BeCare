//
//  DetailsViewController.swift
//  becare
//
//  Created by Renan Luz on 22/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
     var hospital: HospitalModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let hospital = hospital {
            nameLabel.text = hospital.nome
            addressLabel.text = hospital.logradouro
            phoneLabel.text = hospital.telefone
            webSiteLabel.text = ""
            distanceLabel.text = ""
        }
    }
    
    
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var webSiteLabel: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
