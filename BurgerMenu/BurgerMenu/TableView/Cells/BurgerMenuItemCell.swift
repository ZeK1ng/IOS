//
//  BurgerMenuItemCell.swift
//  BurgerMenu
//
//  Created by zeking on 12/10/20.
//

import UIKit

class burgerMenuItemModel {
    var label:String = "Menu Item"
    init(label :String){
        self.label = label
    }
}
class BurgerMenuItemCell: UITableViewCell {
   
    @IBOutlet var btn : UIButton!
    private var model: burgerMenuItemModel!
    
    @IBAction func HandleButton(){
   
    }
    func configure(with model:burgerMenuItemModel){
        btn.setTitle(model.label, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
