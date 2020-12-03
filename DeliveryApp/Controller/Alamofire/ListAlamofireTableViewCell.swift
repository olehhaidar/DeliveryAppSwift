//
//  ListAlamofireTableViewCell.swift
//  DeliveryApp
//
//  Created by Oleh Haidar on 22.11.2020.
//

import UIKit

class ListAlamofireTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainImage: UIImageView?
    @IBOutlet weak var nameRestaurant: UILabel!
    @IBOutlet weak var nameDish: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
