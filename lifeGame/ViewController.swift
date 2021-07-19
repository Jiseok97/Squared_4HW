//
//  ViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    // MARK: View Color
    @IBOutlet weak var headView: UIView!
    
    
    // MARK: Head Prop
    @IBOutlet weak var levleTextLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    var money : Int = 4995
    
    
    
    
    // MARK: 패시브 스킬 UIView
    @IBOutlet weak var firstSkillView: UIView!
    @IBOutlet weak var explainLbl: UILabel!
    @IBOutlet weak var passiveLbl: UILabel!
    
    
    // MARK: 액티브 스킬1 UIView
    @IBOutlet weak var secondSkillView: UIView!
    @IBOutlet weak var activeSkillBtn: UIButton!
    @IBOutlet weak var activeExplainLbl: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameStart()
    }
    
    
    
    
    // MARK: 게임 전체적 스레드
    func gameStart() {
        DispatchQueue.global(qos: .userInitiated).async {
            while(true) {
                self.passiveSkill()
                usleep(1000000)
                DispatchQueue.main.async {
                    self.moneyLbl.text = String(self.money) + " 원"
                    self.setImage()
                    self.activeSkillBtn.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
                }
            }
        }
    }
    
    
 
    // MARK: 이미지 및 라벨 변경 기능
    func setImage()
    {
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
        else if (self.money > 15000){
            self.levleTextLbl.text = "금수저"
            self.characterImg.image = UIImage(named: "level4")
        }
    }
    
    
    
    // MARK: LEVEL마다 패시브 차별화 기능
    func passiveSkill()
    {
        DispatchQueue.main.async {
            if (self.levleTextLbl.text == "흙수저") {
                self.money += 1
                self.explainLbl.text = "패 시 브\n돈 줍기"
                self.firstSkillView.backgroundColor = .brown
                self.passiveLbl.text = "💵 + 1$ / s"
            }
            else if (self.levleTextLbl.text == "동수저") {
                self.money += 10
                self.explainLbl.text = "패 시 브\n통장 이자"
                self.explainLbl.textColor = .brown
                self.levleTextLbl.textColor = .brown
                self.firstSkillView.backgroundColor = .systemGreen
                self.passiveLbl.text = "💵 + 10$ / s"
            }
            else if (self.levleTextLbl.text == "은수저") {
                self.money += 150
                self.explainLbl.text = "패 시 브\n일 보너스"
                self.explainLbl.textColor = .lightGray
                self.levleTextLbl.textColor = .lightGray
                self.firstSkillView.backgroundColor = .systemIndigo
                self.passiveLbl.text = "💵 + 150$ / s"
            }
            else if (self.levleTextLbl.text == "금수저") {
                self.money += 1000
                self.explainLbl.text = "패 시 브\n난 일 안 해"
                self.explainLbl.textColor = .systemYellow
                self.firstSkillView.backgroundColor = .systemRed
                self.levleTextLbl.textColor = .systemYellow
                self.passiveLbl.text = "💵 + 1000$ / s"
            }
        }
    }
  
    @objc func buttonTapped() {
        self.activeSkillBtn.isEnabled = false
        
        self.money += 50
        self.activeSkillBtn.isEnabled = true
    }
}
