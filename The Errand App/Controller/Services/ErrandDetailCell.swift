//
//  ErrandDetailCell.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 18/02/2021.
//

import UIKit

class ErrandDetailCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var recommendedTime: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var smallImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
