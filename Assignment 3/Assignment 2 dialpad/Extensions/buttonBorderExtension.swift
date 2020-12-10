//
//  buttonBorderExtension.swift
//  Assignment 2 dialpad
//
//  Created by zeking on 11/23/20.
//

import UIKit

extension UIButton{
    @IBInspectable var borderColor: UIColor? {
           get {
               return UIColor(cgColor: layer.borderColor!)
           }
           set {
               layer.borderColor = newValue?.cgColor
           }
       }
}
