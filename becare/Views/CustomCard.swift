//
//  CustomCard.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class CustomCard: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCard()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCard()
        
    }
    
    func setupCard() {
       layer.cornerRadius = 10
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowRadius = 5
       layer.shadowOpacity = 0.3
       layer.shadowOffset = CGSize(width: 0, height: 3)
    }
    
    
    
}
