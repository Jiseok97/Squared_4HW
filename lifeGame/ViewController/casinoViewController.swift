//
//  casinoViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/20.
//

import UIKit

protocol sendMoney
{
    func dataSend(fee: Int, get: Int)
}

class casinoViewController: UIViewController {

    @IBOutlet weak var inputMoney: UITextField!
    @IBOutlet weak var bettingBtn: UIButton!
    @IBOutlet weak var resultImgView: UIImageView!
    @IBOutlet weak var exitBtn: UIButton!
    var delegate : sendMoney?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRadius()
    }
    
    // MARK: Radius setting
    func setRadius() {
        self.bettingBtn.layer.cornerRadius = 15
        self.exitBtn.layer.cornerRadius = 15
    }
    
    
    // MARK: 베팅 기능
    @IBAction func bettingMoney(_ sender: Any) {
        let betMoney : Double? = Double(self.inputMoney.text!)
        var result : Int = 0
        let num = arc4random_uniform(8)
        
        switch(num) {
        case 0:
            self.resultImgView.image = UIImage(named: "thirty")
            result = Int(betMoney! * 0.3)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            break
            
        case 1:
            self.resultImgView.image = UIImage(named: "fifty")
            result = Int(betMoney! * 0.5)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            break
            
        case 2:
            self.resultImgView.image = UIImage(named: "oneFifty")
            result = Int(betMoney! * 1.5)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            break
            
        case 3:
            self.resultImgView.image = UIImage(named: "double")
            result = Int(betMoney! * 2)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            break
            
        case 4:
            self.resultImgView.image = UIImage(named: "triple")
            result = Int(betMoney! * 3)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            break
            
        default:
            self.resultImgView.image = UIImage(named: "fail")
            result = 0
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            break
        }
      
        
    }

    
    // MARK: Dismiss
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
