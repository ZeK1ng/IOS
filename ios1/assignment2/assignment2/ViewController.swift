//
//  ViewController.swift
//  assignment2
//
//  Created by zeking on 11/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var txt4: UITextField!
    @IBOutlet var nm: UITextField!
    @IBOutlet var txt3: UITextField!
    @IBOutlet var txt2: UITextField!
    @IBOutlet var getSwifty: UITextField!

    @IBOutlet var midStackv: UIStackView!
    @IBOutlet var txt13: UITextField!
    @IBOutlet var txt12: UITextField!
    @IBOutlet var txt11: UITextField!
    @IBOutlet var txt1: UITextField!
    @IBOutlet var djrick: UITextField!
    @IBOutlet var profPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "retrowave.jpg")!)
        profPic.layer.cornerRadius = profPic.frame.size.width/2
        midStackv.layer.cornerRadius = 16
        profPic.clipsToBounds = true
        djrick.borderStyle = .none
        getSwifty.borderStyle = .none
        nm.borderStyle = .none
    }


}

