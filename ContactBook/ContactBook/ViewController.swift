//
//  ViewController.swift
//  ContactBook
//
//  Created by zeking on 1/4/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ContactBook : UICollectionView!
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        return flowLayout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureNavBar()
        configureContactBook()
       
    }
    override func viewDidLayoutSubviews() {
        print(ContactBook.frame.width/4)
        for i in 0...ContactBook.numberOfSections-1
            {
                for j in 0...ContactBook.numberOfItems(inSection: i) - 1
                {
                    if let cell = ContactBook.cellForItem(at: NSIndexPath(row: j, section: i) as IndexPath) {
                        print(cell.frame.width,cell.frame.height)
                        if let c = cell as? ContactCell{
                            print(c.mainView.frame.width,c.mainView.frame.height)
//                            c.mainView.frame.size.width = cell.frame.width
//                            c.mainView.frame.size.height = cell.frame.height
//                            c.initialsView.frame.size.width = cell.frame.width
//                            c.initialsView.frame.size.height = cell.frame.height
                            print(c.initialsView.frame.height , c.initialsView.frame.height)
                            c.initialsView.layer.cornerRadius = c.initialsView.frame.height/4
                        }
                    }
                    
                }
            }
          
    }
    func configureNavBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
//        navigationItem.rightBarButtonItem = editButtonItem
    }
    @objc func addContact(){
        let dialogMessage = UIAlertController(title: "Add Contact", message: "", preferredStyle: .alert)
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = "Contact name"
        })
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = "Contact number"
        })
        let save = UIAlertAction(title: "Save", style: .default, handler: { (action) -> Void in
            print("Ok button tapped")
            
        })
               
               // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
//        dialogMessage.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 240, green: 240, blue: 240, alpha: 1
        dialogMessage.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.lightGray
        dialogMessage.addAction(save)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    
    func configureContactBook(){
        ContactBook.delegate = self
        ContactBook.dataSource = self
        ContactBook.collectionViewLayout = flowLayout
        ContactBook.register(
            UINib(nibName: "ContactCell", bundle: nil),
            forCellWithReuseIdentifier: "ContactCell"
        )
    }
   
}
extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath)
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 10
    }
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            sizeForItemAt indexPath: IndexPath
        ) -> CGSize {
            let spareWidth = collectionView.frame.width/4
        print("ASDASDA",spareWidth)
        return CGSize(width: spareWidth, height: spareWidth)
    }
    func collectionView(
            _ collectionView: UICollectionView,
            layout collectionViewLayout: UICollectionViewLayout,
            insetForSectionAt section: Int
        ) -> UIEdgeInsets {
            return UIEdgeInsets(
                top:    10,
                left:    10,
                bottom:    0,
                right:    10)
        }
    
}
