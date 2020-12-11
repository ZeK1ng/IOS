//
//  MenuViewController.swift
//  BurgerMenu
//
//  Created by zeking on 12/10/20.
//
import UIKit
class burgerMenuSection {
    var header: MenuHeaderModel?
    var menuItems = [burgerMenuItemModel]()
//    init(header: HeaderCellModel? , items:[burgerMenuItemModel]) {
//        self.header=header
//        self.menuItems=items
//    }
    var numberOfRows: Int{
        if let header = header{
            return header.isExpanded ? menuItems.count : 0
        }
        print("ASDASDAS")
        print(menuItems.count)
        return menuItems.count
        
    }
}
class MenuViewController: UIViewController{
    
    @IBOutlet var table : UITableView!
    @IBOutlet var tableHeight: NSLayoutConstraint!
    private var bgMenuItemData: burgerMenuSection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        
        createBgMenu()
        table.register(UINib(nibName: "BurgerMenuItemCell", bundle: nil),forCellReuseIdentifier: "BurgerMenuItemCell")
       
        table.register(UINib(nibName: "MenuHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "MenuHeader")
        table.tableFooterView = UIView(frame: .zero)
    }


    
    func  createBgMenu() {
        bgMenuItemData = burgerMenuSection()
        bgMenuItemData.header = MenuHeaderModel(isExpanded: false, delegate: self)
        bgMenuItemData.menuItems=[
            burgerMenuItemModel(label: "about us"),
            burgerMenuItemModel(label: "products"),
            burgerMenuItemModel(label: "media"),
            burgerMenuItemModel(label: "contuct us"),
//            burgerMenuItemModel(label: "contuct us"),
//            burgerMenuItemModel(label: "media"),
        ]
    }

}
extension MenuViewController :MenuHeaderDelegate{
    func headerWasClicked(_ header: MenuHeader){
        table.reloadSections(IndexSet(integer: 0), with:.fade)
        guard let hd = bgMenuItemData.header else { return}
        let status = hd.isExpanded
        if status{
            view.backgroundColor = .gray
        }else{
            view.backgroundColor = .white
           	
        }

        self.tableHeight?.constant = self.table.contentSize.height
        print("PRINTIN TALBE CONT SIZE')")
        print(self.table.contentSize.height)
        self.updateViewConstraints()
    }
}
extension MenuViewController: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerModel = bgMenuItemData.header else {
            return nil
        }
        let menHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MenuHeader")
        if let menuHeader = menHeader as? MenuHeader{
            menuHeader.configure(with:headerModel)
        }
        return menHeader
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(bgMenuItemData.numberOfRows)
        return bgMenuItemData.numberOfRows
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(bgMenuItemData.menuItems[indexPath.row].label)
        table.deselectRow(at: indexPath, animated: true)
    }



    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return bgMenuItemData.header == nil ? 0 : 44
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = table.dequeueReusableCell(withIdentifier: "BurgerMenuItemCell",for:indexPath)
        if let menuItem = cell as? BurgerMenuItemCell{
            menuItem.configure(with: bgMenuItemData.menuItems[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44 
    }

}
