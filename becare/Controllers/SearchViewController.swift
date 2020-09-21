//
//  SearchViewController.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchs: [Search] = [
        Search(text: "Hospital 1"),
        Search(text: "Hospital 2"),
        Search(text: "Hospital 3")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(searchs[0].text)
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.delegate = self
      
        tableView.register(UINib(nibName: "SearchCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")   
        
    }
    
}


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

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(searchs[(indexPath.row)].text)
    }
}


