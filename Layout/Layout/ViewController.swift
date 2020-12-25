//
//  ViewController.swift
//  Layout
//
//  Created by zeking on 12/24/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var table : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.register(UINib(nibName: "tbvHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "tbvHeader")
        table.register(UINib(nibName: "tbvDefaultCell", bundle: nil),forCellReuseIdentifier: "tbvDefaultCell")
        table.register(UINib(nibName: "tbvSpecialCell", bundle: nil),forCellReuseIdentifier: "tbvSpecialCell")
    }


}
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != 1{
            let cell = table.dequeueReusableCell(withIdentifier: "tbvDefaultCell",for:indexPath)
            if let cell1 = cell as? tbvDefaultCell{
                cell1.configure()
            }
           
            return cell
        }
        let Specialcell = table.dequeueReusableCell(withIdentifier: "tbvSpecialCell",for:indexPath)
        if let cell1 = Specialcell as? tbvSpecialCell{
            cell1.configure()
        }
       
        return Specialcell
     
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
     
        let tbvHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: "tbvHeader")
        if let header = tbvHeader as? tbvHeader{
            header.configure()
            header.backgroundColor = .white
        }
        return tbvHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 124
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 1 {
             return 150
        } else {
            return 66
        }
    }
    
}

