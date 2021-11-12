//
//  ViewController.swift
//  assignment2
//
//  Created by zeking on 11/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var profPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // self.view.backgroundColor = UIColor(patternImage: UIImage(named: "retrowave.jpg")!)
        profPic.layer.cornerRadius = profPic.frame.size.width/2
        profPic.clipsToBounds = true
    }


}

