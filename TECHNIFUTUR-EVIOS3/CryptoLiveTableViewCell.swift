//
//  CryptoLiveTableViewCell.swift
//  TECHNIFUTUR-EVIOS3
//
//  Created by Student08 on 12/08/2021.
//
import SafariServices
import UIKit

class CryptoLiveTableViewCell: UITableViewCell {

    
    var url : String = ""
    
    @IBAction func didPressInfoButton(_ sender: Any) {
        
   /*     if let url1 = URL(string: url)
        {
        let vc = SFSafariViewController (url: url1)
            present(vc, animated : true)
        }
 */
    }
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(crypto : Crypto){
        numberLabel.text = crypto.rank
        percentLabel.text =  crypto.changePercent24Hr
        priceLabel.text = crypto.priceUsd
        nameLabel.text = crypto.name
        //url = crypto.explorer
        
    }
    
    }
