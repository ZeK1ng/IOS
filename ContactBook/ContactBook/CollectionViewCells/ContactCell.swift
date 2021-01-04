//
//  ContactCell.swift
//  ContactBook
//
//  Created by zeking on 1/4/21.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    @IBOutlet var mainView : UIView!
    @IBOutlet var initialsView : UIView!
    @IBOutlet var initials : UILabel!
    @IBOutlet var number : UILabel!
    @IBOutlet var name : UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        mainView.layer.cornerRadius = 10
        initials.text = "SD"
        number.text = "11111"
        name.text = "NAME"
        mainView.layer.borderWidth = 1
        mainView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    
   
}
