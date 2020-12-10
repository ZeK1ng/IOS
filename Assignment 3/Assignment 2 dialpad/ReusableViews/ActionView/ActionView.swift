//
//  ActionView.swift
//  Delegation
//
//  Created by Saba Khutsishvili on 10/16/20.
//

import UIKit

protocol ActionViewDelegate: AnyObject {
    func actionView(_ sender: ActionView, button1: UIButton) -> String
    func actionView(_ sender: ActionView, button2: UIButton) -> String
    func actionViewDidTapButton1(_ sender: ActionView)
    func actionViewDidTapButton2(_ sender: ActionView)
}

class ActionView: BaseReusableView {
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    
    weak var delegate: ActionViewDelegate? {
        didSet {
            setup()
        }
    }
    
    override func setup() {
        button1.setTitle(delegate?.actionView(self, button1: button1), for: .normal)
        button2.setTitle(delegate?.actionView(self, button2: button2), for: .normal)
    }
    
    @IBAction func handleButton1Tap() {
        delegate?.actionViewDidTapButton1(self)
    }
    
    @IBAction func handleButton2Tap() {
        delegate?.actionViewDidTapButton2(self)
    }
}
