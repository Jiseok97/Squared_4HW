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
    var money : Int = 14990
    
    
    // MARK: Skill View
    @IBOutlet weak var firstSkillView: UIView!
    
    
    // MARK: View Color
    @IBOutlet weak var headView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 그라데이션
//        headView.setGradient(color1: UIColor.darkGray, color2: UIColor.lightGray)
//        setZ()
        passiveSkill()
        setImage()
    }
    
 
    // MARK: Set ImageView & Level Label
    func setImage()
    {
        DispatchQueue.global(qos: .userInteractive).async {
            DispatchQueue.main.async {
                if (self.money <= 5000) {
                    self.levleTextLbl.text = "흙수저"
                    self.characterImg.image = UIImage(named: "level1")
                }
                else if (self.money > 5000 && self.money <= 10000) {
                    self.levleTextLbl.text = "동수저"
                    self.characterImg.image = UIImage(named: "level2")
                }
                else if (self.money > 10000 && self.money <= 15000) {
                    self.levleTextLbl.text = "은수저"
                    self.characterImg.image = UIImage(named: "level3")
                }
                else {
                    self.levleTextLbl.text = "금수저"
                    self.characterImg.image = UIImage(named: "level4")
                }
            }
        }
    }
    
    
    // MARK: 패시브 스킬
    func passiveSkill() {
        DispatchQueue.global(qos: .background).async {
            while(true) {
                self.money += 1
                usleep(1000000)
                DispatchQueue.main.async {
                    self.moneyLbl.text = String(self.money) + " 원"
                }
            }
        }
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
