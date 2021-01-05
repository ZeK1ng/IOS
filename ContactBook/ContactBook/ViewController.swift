//
//  ViewController.swift
//  ContactBook
//
//  Created by zeking on 1/4/21.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    @IBOutlet var ContactBook : UICollectionView!
    
    var db = DBController.shared.persistentContainer.viewContext
    
        
    lazy var contacts = [Contact]()
    
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
        fetchData()
    }
    
    override func viewDidLayoutSubviews() {
//        print(ContactBook.frame.width/4)
        if contacts.count > 0 {
            for cell in ContactBook.visibleCells{
             
                guard let c = cell as? ContactCell else { return }
                c.initialsView.layer.cornerRadius = (c.initialsView.frame.width)/2

                c.layoutIfNeeded()
                c.contentView.layoutIfNeeded()
                cell.layoutIfNeeded()
                cell.contentView.layoutIfNeeded()
            }
        }
    }
    func fetchData(){
        let request = Contact.fetchRequest() as NSFetchRequest<Contact>
        do {
            contacts = try db.fetch(request)
            ContactBook.reloadData()
            self.viewDidLayoutSubviews()
        } catch {}
        
    }
    func configureNavBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContact))
    }
    func configureContactBook(){
        ContactBook.delegate = self
        ContactBook.dataSource = self
        ContactBook.collectionViewLayout = flowLayout
        ContactBook.register(
            UINib(nibName: "ContactCell", bundle: nil),
            forCellWithReuseIdentifier: "ContactCell"
        )
        ContactBook.addGestureRecognizer(
            UILongPressGestureRecognizer(
                target: self,
                action: #selector(handleLongPress(gesture:))
            )
        )
    }
    @objc func handleLongPress(gesture: UILongPressGestureRecognizer){
        let location = gesture.location(in: ContactBook)
        if let indexPath = ContactBook.indexPathForItem(at: location) {
                deleteContact(at: indexPath)
        }
    }
    func deleteContact(at indexPath: IndexPath){
        let alert = UIAlertController(title: "Delete this Contact?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { [unowned self] _ in
            let contact = contacts[indexPath.row]
            db.delete(contact)
            do{
                try db.save()
                self.fetchData()
            }catch{}
         
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @objc func addContact(){
        let dialogMessage = UIAlertController(title: "Add Contact", message: "", preferredStyle: .alert)
        
        var nameField : UITextField?
        var numberField : UITextField?
        
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = "Contact name"
            nameField = textField
        })
        dialogMessage.addTextField(configurationHandler: { textField in
            textField.placeholder = "Contact number"
            numberField = textField
        })
        let save = UIAlertAction(title: "Save", style: .default, handler: { [unowned self] _ in
            guard let name = nameField!.text?.trimmingCharacters(in: .whitespacesAndNewlines) , let number = numberField!.text?.trimmingCharacters(in: .whitespacesAndNewlines), !name.isEmpty, !number.isEmpty
            else {return}
    
            let newContact = Contact(context: db)
            newContact.name = name
            newContact.number = number
            do{
                try db.save()
                self.fetchData()
            }catch{}
        })
        save.isEnabled = false
               // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object:dialogMessage.textFields?[0],
                                                queue: OperationQueue.main)
        { (notification) -> Void in

            let nameField = dialogMessage.textFields![0]
            let numberField = dialogMessage.textFields![1]
            let name = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let number = numberField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            save.isEnabled = !name.isEmpty && !number.isEmpty && self.isValidNumber(str: number)
        }


        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object:dialogMessage.textFields?[1],
                                            queue: OperationQueue.main)
        { (notification) -> Void in

            let numberField = dialogMessage.textFields![1]
            let nameField = dialogMessage.textFields![0]
            let name = nameField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let number = numberField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            save.isEnabled = !name.isEmpty && !number.isEmpty && self.isValidNumber(str: number)
        }
//        dialogMessage.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 240, green: 240, blue: 240, alpha: 1
        dialogMessage.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.lightGray
        dialogMessage.addAction(save)
        dialogMessage.addAction(cancel)
        self.present(dialogMessage, animated: true, completion: nil)
    }
    func isValidNumber(str:String) -> Bool{
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for i in str{
            if !nums.contains(i){ return false }
        }
        return true
    }

   
}
extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contacts.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContactCell", for: indexPath)
        if let newCell = cell as? ContactCell {
            let contact = contacts[indexPath.row]
            let name = contact.name
            let nameArr = name!.components(separatedBy: " ")
            var initials = ""
            if nameArr.count == 2 {
                let fname = nameArr[0]
                let lname = nameArr[1]
                let firstInitial = (fname as NSString).substring(with: NSMakeRange(0, 1))
                let lastInitial = (lname as NSString).substring(with: NSMakeRange(0, 1))
                initials.append(String(firstInitial.uppercased()))
                initials.append(String(lastInitial).uppercased())
            }
            if nameArr.count == 1{
                let nm = nameArr[0]
                let firstInitial = (nm as NSString).substring(with: NSMakeRange(0, 1))
                initials.append(String(firstInitial).uppercased())
            }
            newCell.number.text = contact.number
            newCell.name.text = nameArr[0]
            newCell.initials.text = initials
            newCell.layoutIfNeeded()
            newCell.contentView.layoutIfNeeded()
        }
        cell.contentView.layoutIfNeeded()
        cell.layoutIfNeeded()
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
        ) -> CGSize
    {
        let spareWidth = collectionView.frame.width/4
        let spareHeight = collectionView.frame.height/5
        return CGSize(width: spareWidth, height: spareHeight)
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
