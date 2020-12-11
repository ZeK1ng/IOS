//
//  MenuHeader.swift
//  BurgerMenu
//
//  Created by zeking on 12/11/20.
//

import UIKit
class MenuHeaderModel{
    
//    var buttonLogo: String
    var isExpanded: Bool
    weak var delegate: MenuHeaderDelegate?
    init(isExpanded:Bool,delegate: MenuHeaderDelegate?){
        self.delegate = delegate
        self.isExpanded = isExpanded
    }
    
}
protocol MenuHeaderDelegate: AnyObject {
    func headerWasClicked(_ header: MenuHeader)
}
class MenuHeader: UITableViewHeaderFooterView {
    
    @IBOutlet var btn: UIButton!
    private var ButtonLogoString: String!
     var model: MenuHeaderModel!

    @IBAction func handleClick(){
        model.isExpanded.toggle()
        model.delegate?.headerWasClicked(self)
    }
    func configure(with model: MenuHeaderModel){
        self.btn.tintColor = UIColor.orange
        let status = model.isExpanded
        if !status{
            self.btn.setImage(UIImage(systemName: "line.horizontal.3"), for: .normal)
        }else{
            self.btn.setImage(UIImage(systemName: "xmark.octagon"), for: .normal)
        }
        self.model = model
        
    }
    
  
}
