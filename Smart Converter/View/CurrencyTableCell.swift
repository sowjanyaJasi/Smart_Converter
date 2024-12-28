//
//  CurrencyTableCell.swift
//  Smart Converter
//
//  Created by Sowjanya on 29/12/24.
//

import UIKit

class CurrencyTableCell: UITableViewCell {
    @IBOutlet weak var currencyName: UILabel!
    
    var currencyObj: SelectedCurrency?{
        didSet {
            currencyName.text = currencyObj?.code
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
}
