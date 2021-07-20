//
//  ViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Header UIViews
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var moneyView: UIView!
    // Mid View
    @IBOutlet weak var midView: UIView!
    
    
    
    
    // MARK: Head Prop
    @IBOutlet weak var levleTextLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    var money : Int = 12000
    
    
    
    
    // MARK: 패시브 스킬 UIView
    @IBOutlet weak var firstSkillView: UIView!
    @IBOutlet weak var explainLbl: UILabel!
    @IBOutlet weak var passiveLbl: UILabel!
    
    
    // MARK: 액티브 기능1 UIView
    @IBOutlet weak var secondSkillView: UIView!
    @IBOutlet weak var activeSkillBtn: UIButton!
    @IBOutlet weak var activeExplainLbl: UILabel!
    
    
    // MARK: 액티브 기능2 UIView
    @IBOutlet weak var thirdSkillView: UIView!
    
    
    
    // MARK: 액티브 기능3 UIView
    @IBOutlet weak var fourthSkillView: UIView!
    
    

    
    // MARK: 상점 UIView
    @IBOutlet weak var marketView: UIView!
    
    
    
    
    // MARK: 업그레이드 UIView
    @IBOutlet weak var upgradeView: UIView!
    
    
    
    // MARK: 랜덤
//    var random = arc4random_uniform(300) - 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setRadius()
        gameStart()
    }
    
    // MARK: UIView Radius
    func setRadius() {
        self.firstSkillView.layer.cornerRadius = 25
        self.secondSkillView.layer.cornerRadius = 25
        self.thirdSkillView.layer.cornerRadius = 25
        self.fourthSkillView.layer.cornerRadius = 25
        self.marketView.layer.cornerRadius = 20
        self.upgradeView.layer.cornerRadius = 20
        self.levelView.layer.cornerRadius = 20
        self.moneyView.layer.cornerRadius = 20
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
                
                // 액티브 1
                self.activeSkillBtn.setTitle("전단지 알바", for: .normal)
                self.activeExplainLbl.text = "💵 + 100$ / 10s"
                
            }
            
            
            else if (self.levleTextLbl.text == "동수저") {
                self.money += 10
                self.explainLbl.text = "패 시 브\n통장 이자"
                self.explainLbl.textColor = .brown
                self.levleTextLbl.textColor = .brown
                self.firstSkillView.backgroundColor = .systemGreen
                self.passiveLbl.text = "💵 + 10$ / s"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("과외 알바", for: .normal)
                self.activeExplainLbl.text = "💵 + 300$ / 10s"
            }
            
            
            else if (self.levleTextLbl.text == "은수저") {
                self.money += 150
                self.explainLbl.text = "패 시 브\n일 보너스"
                self.explainLbl.textColor = .systemGray
                self.levleTextLbl.textColor = .systemGray
                self.firstSkillView.backgroundColor = .systemIndigo
                self.headView.backgroundColor = .systemGray4
                self.midView.backgroundColor = .systemGray4
                self.passiveLbl.textColor = .systemGray
                self.passiveLbl.text = "💵 + 150$ / s"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("추가수당", for: .normal)
                self.activeExplainLbl.text = "💵 + 750$ / 10s"
            }
            
            
            else if (self.levleTextLbl.text == "금수저") {
                self.money += 1000
                self.explainLbl.text = "패 시 브\n난 일 안 해"
                self.explainLbl.textColor = .systemYellow
                self.firstSkillView.backgroundColor = .systemRed
                self.levleTextLbl.textColor = .systemYellow
                self.headView.backgroundColor = .darkGray
                self.midView.backgroundColor = .darkGray
                self.passiveLbl.textColor = .systemYellow
                self.passiveLbl.text = "💵 + 1000$ / s"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("월세 올리기", for: .normal)
                self.activeExplainLbl.text = "💵 + 3000$ / 10s"
            }
        }
    }
  
    
    
    
    
    
    // MARK: 액티브 버튼 1
    @objc func buttonTapped() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.activeSkillBtn.isEnabled = false
                self.activeSkillBtn.tintColor = .systemGray
                self.activeSkillBtn.setTitle("일 하는 중", for: .normal)
                self.activeSkillBtn.backgroundColor = .systemGray
                self.secondSkillView.backgroundColor = .systemGray
                self.activeExplainLbl.text = "힘들어..."
            }
            usleep(5000000)
            DispatchQueue.main.async {
                self.activeSkillBtn.isEnabled = true
                self.secondSkillView.backgroundColor = .white
                self.activeSkillBtn.backgroundColor = .white
                self.differentMoney()
                
            }
        }
    }
  
    
    func differentMoney() {
        if (self.levleTextLbl.text == "흙수저") {
            self.activeSkillBtn.setTitle("전단지 알바", for: .normal)
            self.activeExplainLbl.text = "💵 + 100$ / 10s"
            self.money += 100
        }
        else if (self.levleTextLbl.text == "동수저") {
            self.activeSkillBtn.setTitle("과외 알바", for: .normal)
            self.activeExplainLbl.text = "💵 + 300$ / 10s"
            self.money += 300
        }
        else if (self.levleTextLbl.text == "은수저") {
            
            self.money += 750
        }
        else if (self.levleTextLbl.text == "금수저") {
            self.activeSkillBtn.setTitle("월세 올리기", for: .normal)
            self.activeExplainLbl.text = "💵 + 3000$ / 10s"
            self.money += 3000
        }
        
    }
    
    
    
    
    
    
    
    // MARK: 액티브 비트코인
    func randomNumber()
    {
        let num = arc4random_uniform(5000)
        let result = Int(num) - 2600
        print("\(result)")
    }
    
    
    
}
