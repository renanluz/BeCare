//
//  ResultCell.swift
//  becare
//
//  Created by Renan Luz on 21/09/20.
//  Copyright © 2020 RenanLuz. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var timeBubble: UIView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var unityLabel: UILabel!
    
    
    @IBOutlet weak var hospitalBubble: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
        self.timeBubble.clipsToBounds = true
        timeBubble.layer.cornerRadius = 10
        timeBubble.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 3)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


   
