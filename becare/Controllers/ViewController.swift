//
//  ViewController.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchButton: CustomButton!
    
    
    
    @IBAction func searchButtonPressed(_ sender: CustomButton) {
        self.performSegue(withIdentifier: "goToSearch", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

