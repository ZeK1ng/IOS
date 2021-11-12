//
//  ViewController.swift
//  assignment1
//
//  Created by zeking on 10/12/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var erteulebi: [UIView]!
    @IBOutlet var ateulebi: [UIView]!
    @IBOutlet var aseulebi: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        showAlertForNumber()

    }
    
    func showAlertForNumber(){
        let alert = UIAlertController(title:"", message: "Choose your number", preferredStyle:.alert)
        alert.addTextField{field in
            field.placeholder = "3 digit number"
            field.addTarget(self, action: #selector(self.textChanged), for: .editingChanged)
        }
        alert.addAction(UIAlertAction(title:"Ok",style: .default ,handler:{_ in
            guard let fields = alert.textFields, fields.count == 1 else {return}
            let field = fields[0]
            let text = field.text
            if(text!.isEmpty || text?.count != 3 ){
                field.layer.borderColor = UIColor.red.cgColor
                field.text = ""
            }else{
                let n:Int = Int(text!)!
                let number:Int = n
                self.drawNumber(number: number)
            }
        }))
        alert.actions[0].isEnabled = false
      
        present(alert,animated: true)
    }
    @objc func textChanged(_ sender :Any){
        let tf = sender as! UITextField
        var resp: UIResponder! = tf
        while !(resp is UIAlertController){resp = resp.next}
        let alert = resp as! UIAlertController
        alert.actions[0].isEnabled = (tf.text != "" && tf.text?.count == 3 && (Int(tf.text!) != nil))
        
    }
    func drawNumber(number:Int){
        var hundreds: Int!
        var tens: Int!
        var ones: Int!
        hundreds = number/100
        tens = number%10
        ones = (number/10)%10
        switchOnDisplay(hundreds: hundreds,tens: tens,ones: ones)
       
    }
    func switchOnDisplay(hundreds:Int!,tens:Int!,ones:Int!){
        colorNumb(arr: &aseulebi, n: hundreds)
        colorNumb(arr: &erteulebi, n: tens)
        colorNumb(arr: &ateulebi, n: ones)
    }
    func colorNumb(arr: inout [UIView], n:Int){
        switch n {
        case 0:
            switchOn(v:&arr[0])
            switchOn(v:&arr[1])
            switchOn(v:&arr[3])
            switchOn(v:&arr[4])
            switchOn(v:&arr[5])
            switchOn(v:&arr[6])
        case 1:
            switchOn(v:&arr[3])
            switchOn(v:&arr[5])
        case 2:
            switchOn(v:&arr[2])
            switchOn(v:&arr[1])
            switchOn(v:&arr[3])
            switchOn(v:&arr[4])
            switchOn(v:&arr[6])
        case 3:
            switchOn(v:&arr[2])
            switchOn(v:&arr[1])
            switchOn(v:&arr[3])
            switchOn(v:&arr[5])
            switchOn(v:&arr[6])
        case 4:
            switchOn(v:&arr[0])
            switchOn(v:&arr[2])
            switchOn(v:&arr[3])
            switchOn(v:&arr[5])
        case 5:
            switchOn(v:&arr[0])
            switchOn(v:&arr[1])
            switchOn(v:&arr[2])
            switchOn(v:&arr[5])
            switchOn(v:&arr[6])
        case 6:
            switchOn(v:&arr[0])
            switchOn(v:&arr[1])
            switchOn(v:&arr[2])
            switchOn(v:&arr[5])
            switchOn(v:&arr[6])
            switchOn(v:&arr[4])
        case 7:
            switchOn(v:&arr[0])
            switchOn(v:&arr[1])
            switchOn(v:&arr[3])
            switchOn(v:&arr[5])
        case 8:
            switchOn(v:&arr[0])
            switchOn(v:&arr[1])
            switchOn(v:&arr[2])
            switchOn(v:&arr[5])
            switchOn(v:&arr[6])
            switchOn(v:&arr[4])
            switchOn(v:&arr[3])
        case 9:
            switchOn(v:&arr[0])
            switchOn(v:&arr[1])
            switchOn(v:&arr[2])
            switchOn(v:&arr[5])
            switchOn(v:&arr[3])
        default:
            return
        }
    }
    func switchOn(v: inout UIView){
        v.backgroundColor = .red
    }
}

