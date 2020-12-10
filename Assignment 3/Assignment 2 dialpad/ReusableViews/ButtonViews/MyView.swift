//
//  MyView.swift
//  Assignment 2 dialpad
//
//  Created by zeking on 11/9/20.
//

import UIKit
protocol MyViewDelegate: AnyObject {
    func buttonTapped(_ sender: MyView, value: String)
    func getValue(_ sender:MyView) -> Int
    func getTextValue(_ sender:MyView) -> String
    func getSecondaryTextValue(_ sender:MyView) -> String
}
class MyView: BaseReusableView{
    
    @IBOutlet var customButton: UIView!
    @IBOutlet var customLabel: UILabel!
    @IBOutlet var txtLabel: UILabel!
    var value: Int!
    weak var delegate: MyViewDelegate?{
        didSet{
            setup()
        }
    }
    override func setup() {
        customLabel.adjustsFontSizeToFitWidth = true
        customLabel.minimumScaleFactor = 0.5
        txtLabel.adjustsFontSizeToFitWidth = true
        customLabel.minimumScaleFactor = 0.5
        customButton.layer.cornerRadius = customButton.frame.width/2
        customButton.clipsToBounds = true
        customButton.backgroundColor = .gray
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.someAction (_:)))
        self.customButton.addGestureRecognizer(gesture)
        value = delegate?.getValue(self)
        customLabel.text = delegate?.getTextValue(self)
        txtLabel.text = delegate?.getSecondaryTextValue(self)
        
    }

    @objc func someAction(_ sender:UITapGestureRecognizer){
        delegate?.buttonTapped(self,value: customLabel.text!)
    }
}
