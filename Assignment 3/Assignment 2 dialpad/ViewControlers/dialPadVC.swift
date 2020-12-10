//
//  dialpadController.swift
//  Assignment 2 dialpad
//
//  Created by zeking on 11/8/20.
//

import UIKit

class dialPadVC:UIViewController{
    
//    @IBOutlet var numberLabel!: UILabel!
//
    @IBOutlet var numLab: UILabel!
    @IBOutlet var but1: MyView!
    @IBOutlet var but2: MyView!
    @IBOutlet var but3: MyView!
    @IBOutlet var but4: MyView!
    @IBOutlet var but5: MyView!
    @IBOutlet var but6: MyView!
    @IBOutlet var but7: MyView!
    @IBOutlet var but8: MyView!
    @IBOutlet var but9: MyView!
    @IBOutlet var but0: MyView!
    @IBOutlet var butHashtag: MyView!
    @IBOutlet var butStar: MyView!
    @IBOutlet var butCall: MyView!
    @IBOutlet var butEmpty: MyView!
    @IBOutlet var butClear: MyView!
    var buttonArr: [MyView]!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numLab.text = ""
        buttonArr = [but1,but2,but3,but4,but5,but6,but7,but8,but9,but0,butHashtag,butStar,butCall,butClear]
        for button in buttonArr {
            button.delegate = self
        }
        numLab.adjustsFontSizeToFitWidth = true
        numLab.minimumScaleFactor = 0.5
       
    }
    override func viewDidLayoutSubviews() {
        for button in buttonArr{
            button.customButton.layer.cornerRadius = button.customButton.frame.height/2
        }
        butEmpty.customButton.backgroundColor = .white
        butCall.customButton.backgroundColor = .green
    }
    @IBAction func presentCallScreen(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let callScreen = mainStoryBoard.instantiateViewController(identifier: "callScreenVController")
        callScreen.modalPresentationStyle = .overFullScreen
        present(callScreen,animated: true,completion: nil)
    }
    @IBAction func pushCallScreen(){
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let contactScreen = mainStoryBoard.instantiateViewController(identifier: "ContactsVC")
        if(numLab.text != ""){
            navigationController?.pushViewController(contactScreen, animated: true)
        }
    }
}
extension dialPadVC:MyViewDelegate{
    func getValue(_ sender: MyView) -> Int {
        if sender==but1 {return 1}
        if sender == but2 {return 2}
        if sender == but3 {return 3}
        if sender == but4 {return 4}
        if sender == but5{return 5}
        if sender == but6 {return 6}
        if sender == but7 {return 7}
        if sender == but8{return 8}
        if sender == but9{return 9}
        if sender == but0 {return 0}        
        if sender == butEmpty{
            return 0
        }
        return 0
    }
    func getTextValue(_ sender:MyView) -> String{
        if sender==but1 {return "1"}
        if sender == but2 {return "2"}
        if sender == but3 {return "3"}
        if sender == but4 {return "4"}
        if sender == but5{return "5"}
        if sender == but6 {return "6"}
        if sender == but7 {return "7"}
        if sender == but8{return "8"}
        if sender == but9{return "9"}
        if sender == but0 {return "0"}
        if sender == butStar{return "*"}
        if sender == butHashtag{return "#"}
        if sender == butCall{return "Call"}
        if sender == butClear {return "Del"}
        return ""
    }
    func getSecondaryTextValue(_ sender:MyView) -> String{
        if sender==but1 {return ""}
        if sender == but2 {return "A B C"}
        if sender == but3 {return "D E F"}
        if sender == but4 {return "G H I"}
        if sender == but5{return "J K L"}
        if sender == but6 {return "M N O"}
        if sender == but7 {return "P Q R S"}
        if sender == but8{return "T U V"}
        if sender == but9{return "W X Y Z"}
        if sender == but0 {return "+"}
        if sender == but1 {but1.txtLabel.removeFromSuperview()}
        return ""
    }
    func buttonTapped(_ sender: MyView,value: String) {
        if (sender == butCall && numLab.text != "" ){
            let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
            let callScreen = mainStoryBoard.instantiateViewController(identifier: "callScreenVController")
            callScreen.modalPresentationStyle = .overFullScreen
            present(callScreen,animated: true,completion: nil)
            return
        }
        if sender == butClear{
            if numLab.text != ""{
                numLab.text = String((numLab.text?.dropLast())!)
            }
            return
        }
        if(sender != butCall){
            numLab.text = numLab.text! + value
        }
      
        
    }
    
    
}
