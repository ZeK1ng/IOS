//
//  tbvHeader.swift
//  Layout
//
//  Created by zeking on 12/24/20.
//

import UIKit
class tbvHeader:UITableViewHeaderFooterView{
    
    @IBOutlet var view1 :UIView!
    @IBOutlet var view2: UIView!
    
    func configure(){
        view1.layer.cornerRadius = 8
        view2.layer.cornerRadius = 8
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.backgroundColor = .white
    }
}
