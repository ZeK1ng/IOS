//
//  tbvDefaultCell.swift
//  Layout
//
//  Created by zeking on 12/24/20.
//

import UIKit

class tbvDefaultCell: UITableViewCell {
    @IBOutlet var v: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(){
        v.layer.cornerRadius = 8
    }
    
}
