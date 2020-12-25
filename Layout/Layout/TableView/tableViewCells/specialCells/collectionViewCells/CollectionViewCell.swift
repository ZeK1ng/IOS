//
//  CollectionViewCell.swift
//  Layout
//
//  Created by zeking on 12/25/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var v : UIView!
    @IBOutlet var v1: UIView!
    @IBOutlet var v2: UIView!
    @IBOutlet var v3: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        v.layer.cornerRadius = 5
        v1.layer.cornerRadius = 5
        v2.layer.cornerRadius = 5
        v3.layer.cornerRadius = 5
        
    }

}
