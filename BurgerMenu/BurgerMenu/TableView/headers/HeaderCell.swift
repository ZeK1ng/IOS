//
//  HeaderCell.swift
//  BurgerMenu
//
//  Created by zeking on 12/11/20.
//

import UIKit
class HeaderCellModel{
    var buttonLogo: String
    init(buttonLogo: String){
        self.buttonLogo = buttonLogo
    }
}
class HeaderCell: UITableViewCell {

    @IBOutlet var btn : UIButton!
    private var ButtonLogoString: String!
    private var model: HeaderCellModel!

    func configure(with model: HeaderCellModel){
        self.ButtonLogoString = model.buttonLogo
        
        self.btn.setImage(UIImage(named: self.ButtonLogoString), for: .normal)
    }
    
  
}
