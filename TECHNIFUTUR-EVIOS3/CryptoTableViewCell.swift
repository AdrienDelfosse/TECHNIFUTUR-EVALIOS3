//
//  CryptoTableViewCell.swift
//  TECHNIFUTUR-EVIOS3
//
//  Created by Student08 on 12/08/2021.
//

import UIKit
import AlamofireImage
class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var cryptoIcon: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(detail : ImageStruct){
        nameLabel.text = detail.name
        cryptoIcon.af.setImage(withURL: URL(string: detail.icon)!)
        
    }
    
}
