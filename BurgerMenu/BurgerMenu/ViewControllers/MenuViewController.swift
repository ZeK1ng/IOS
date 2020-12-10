//
//  MenuViewController.swift
//  BurgerMenu
//
//  Created by zeking on 12/10/20.
//
import UIKit

class MenuViewController: UIViewController{
    
    @IBOutlet var table : UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        table.register(UINib(nibName: "BurgerMenuItemCell", bundle: nil),forCellReuseIdentifier: "BurgerMenuItemCell")
       
        table.register(UINib(nibName: "HeaderCell", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderCell")
    }

}
extension MenuViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        table.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = table.dequeueReusableCell(withIdentifier: "BurgerMenuItemCell",for:indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44 
    }

}
