//
//  ViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: Head Prop
    @IBOutlet weak var levleTextLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    var money : Int = 0
    
    
    // MARK: Skill View
    @IBOutlet weak var firstSkillView: UIView!
    
    
    // MARK: View Color
    @IBOutlet weak var headView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 그라데이션
//        headView.setGradient(color1: UIColor.darkGray, color2: UIColor.lightGray)
//        setZ()
        setMoney()
        setImage()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    // MARK: Set Money Label
    func setMoney() {
        self.moneyLbl.text = String(money) + "원"
    }
    
    
    // MARK: Set ImageView & Level Label
    func setImage()
    {
        if (money <= 5000) {
            self.levleTextLbl.text = "거지"
            self.characterImg.image = UIImage(named: "level1")
        }
        else if (money > 5000 && money <= 10000) {
            self.levleTextLbl.text = "일반인"
            self.characterImg.image = UIImage(named: "level2")
        }
        else if (money > 10000 && money <= 15000) {
            self.levleTextLbl.text = "대기업 임원"
            self.characterImg.image = UIImage(named: "level3")
        }
        else {
            self.levleTextLbl.text = "부자"
            self.characterImg.image = UIImage(named: "level4")
        }
    }
    
    func passiveSkill() {
        self.money += 1
    }
    
    
    
    
    
    // MARK: zPositon Function
    func setZ()
    {
        headView.layer.zPosition = 0
        levleTextLbl.layer.zPosition = 10
        moneyLbl.layer.zPosition = 10
    }
}









// MARK: View 그라데이션 기능
extension UIView{
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}



// MARK: Button 그라데이션 + 테두리
// 사용 예시
// testView.gradientButton("Hello", startColor: .red, endColor: .blue)
extension UIView{

    func gradientButton(_ buttonText:String, startColor:UIColor, endColor:UIColor) {

        let button:UIButton = UIButton(frame: self.bounds)
        button.setTitle(buttonText, for: .normal)

        let gradient = CAGradientLayer()
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
        self.mask = button

        button.layer.cornerRadius =  button.frame.size.height / 2
        button.layer.borderWidth = 5.0
    }
}
