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
    var delegate : sendMoney?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func bettingMoney(_ sender: Any) {
        let betMoney : Double? = Double(self.inputMoney.text!)
        var extraNum : Double = 0.0
        var result : Int = 0
        let num = arc4random_uniform(8)
        switch(num) {
        case 0:
            self.resultImgView.image = UIImage(named: "thirty")
//            result = Int(betMoney)? * Int(0.3)
            
            extraNum = betMoney! * 0.1
            result = Int(extraNum * 3)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            print("\(result)")
            break
            
        case 1:
            self.resultImgView.image = UIImage(named: "fifty")
//            result = Int(betMoney)? * Int(0.5)
            print("fifty")
            extraNum = betMoney! * 0.1
            result = Int(extraNum * 5)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            print("\(result)")
            break
            
        case 2:
            self.resultImgView.image = UIImage(named: "oneFifty")
//            result = Int(betMoney)? * Int(1.5)
            print("oneFifty")
            extraNum = betMoney! * 0.1
            result = Int(extraNum * 15)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            print("\(result)")
            break
            
        case 3:
            self.resultImgView.image = UIImage(named: "double")
//            result = Int(betMoney)? * Int(2)
            print("double")
            extraNum = betMoney! * 0.1
            result = Int(extraNum * 20)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            print("\(result)")
            break
            
        case 4:
            self.resultImgView.image = UIImage(named: "triple")
//            result = Int(betMoney)? * Int(3)
            print("triple")
            extraNum = betMoney! * 0.1
            result = Int(extraNum * 30)
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            print("\(result)")
            break
            
        default:
            self.resultImgView.image = UIImage(named: "fail")
            print("fail")
            result = 0
            delegate?.dataSend(fee: Int(betMoney!), get: result)
            print("\(result)")
            break
        }
      
        
    }
    
    
    
    
    
    
    
    
    // MARK: Dismiss
    @IBAction func exit(_ sender: Any) {
        // 텍스트 필드의 데이터를 정수로 바꿔서
        // 보내기
        dismiss(animated: true, completion: nil)
    }
    
}
