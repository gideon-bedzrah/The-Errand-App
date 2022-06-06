//
//  ItemsCell.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 21/02/2021.
//

import UIKit

class ShopsCell: UITableViewCell {
    
    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopLocations: UILabel!
    @IBOutlet weak var shopItems: UILabel!
    @IBOutlet weak var operatingTime: UILabel!
    @IBOutlet weak var shopImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
