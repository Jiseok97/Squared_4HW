//
//  ViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/19.
//

// MARK: 각 액티브 버튼마다 시간 제한 확인하기 !


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
    var money : Int = 13000
    
    
    
    
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
    @IBOutlet weak var activeSecondBtn: UIButton!
    @IBOutlet weak var explainSecondLbl: UILabel!
    
    
    
    // MARK: 액티브 기능3 UIView
    @IBOutlet weak var fourthSkillView: UIView!
    @IBOutlet weak var activeThirdBtn: UIButton!
    @IBOutlet weak var explainThirdLbl: UILabel!
    
    

    
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
                    // 액티브 버튼 1
                    self.activeSkillBtn.addTarget(self, action: #selector(self.firstButtonTapped), for: .touchUpInside)
                    // 액티브 버튼 2
                    self.activeSecondBtn.addTarget(self, action: #selector(self.secondButtonTapped), for: .touchUpInside)
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
            self.cantSecondBtn()
        }
        else if (self.money > 5000 && self.money <= 10000) {
            self.levleTextLbl.text = "동수저"
            self.characterImg.image = UIImage(named: "level2")
            self.cantSecondBtn()
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
    
    
    
    // MARK: LEVEL마다 UI & 패시브 차별화
    func passiveSkill()
    {
        DispatchQueue.main.async {
            
            if (self.levleTextLbl.text == "흙수저") {
                self.money += 1
                self.explainLbl.text = "패 시 브\n돈 줍기"
                self.firstSkillView.backgroundColor = .brown
                self.passiveLbl.text = "💵 + 1$ / 1초"
                self.passiveLbl.textColor = .black
                self.levleTextLbl.textColor = .black
                
                // 액티브 1
                self.activeSkillBtn.setTitle("전단지 알바", for: .normal)
                self.activeExplainLbl.text = "💵 + 100$ / 10초"

                
            }
            
            
            else if (self.levleTextLbl.text == "동수저") {
                self.money += 10
                self.explainLbl.text = "패 시 브\n통장 이자"
                self.explainLbl.textColor = .brown
                self.levleTextLbl.textColor = .brown
                self.firstSkillView.backgroundColor = .systemGreen
                self.passiveLbl.text = "💵 + 10$ / 1초"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("과외 알바", for: .normal)
                self.activeExplainLbl.text = "💵 + 300$ / 10초"
                
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
                self.passiveLbl.text = "💵 + 150$ / 1초"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("추가수당", for: .normal)
                self.activeExplainLbl.text = "💵 + 750$ / 10초"
                
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
                self.passiveLbl.text = "💵 + 1000$ / 1초"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("월세 올리기", for: .normal)
                self.activeExplainLbl.text = "💵 + 3000$ / 10초"
            }
        }
    }
  
    
    
    
    
    
    // MARK: 액티브 버튼 1 스레드
    @objc func firstButtonTapped() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.clickFirstBtn()
            }
            usleep(5000000)
            DispatchQueue.main.async {
                self.difFirstMoney()
                self.afterClickFirstBtn()
                
            }
        }
    }
    
    // MARK: 액티브 버튼 1 클릭
    func clickFirstBtn()
    {
        self.activeSkillBtn.isEnabled = false
        self.activeSkillBtn.tintColor = .systemGray
        self.activeSkillBtn.setTitleColor(.lightGray, for: .normal)
        self.activeSkillBtn.backgroundColor = .systemGray
        self.secondSkillView.backgroundColor = .systemGray
        self.activeExplainLbl.textColor = .lightGray
    }
    // MARK: 액티브 버튼 1 클릭 후
    func afterClickFirstBtn()
    {
        self.secondSkillView.backgroundColor = .white
        self.activeSkillBtn.backgroundColor = .white
        self.activeSkillBtn.setTitleColor(.black, for: .normal)
        self.activeExplainLbl.textColor = .black
        self.activeSkillBtn.isEnabled = true
    }
    // MARK: 액티브 버튼 1 버는 돈
    func difFirstMoney() {
        if (self.levleTextLbl.text == "흙수저") {
            self.money += 100
        }
        else if (self.levleTextLbl.text == "동수저") {
            self.money += 300
        }
        else if (self.levleTextLbl.text == "은수저") {
            self.money += 750
        }
        else if (self.levleTextLbl.text == "금수저") {
            self.money += 3000
        }
        
    }
    

    
    // MARK: 액티브 버튼 2 스레드
    @objc func secondButtonTapped() {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.clickSecondBtn()
            }
            usleep(10000000)
            DispatchQueue.main.async {
                self.setSecondBtn()
                self.bitCoinFunction()
            }
        }
    }
    // MARK: 버튼 클릭시
    func clickSecondBtn() {
        self.activeSecondBtn.isEnabled = false
        self.money -= 3000
        self.thirdSkillView.backgroundColor = .systemYellow
        self.activeSecondBtn.setTitle("투자중...", for: .normal)
        self.activeSecondBtn.setTitleColor(.lightGray, for: .normal)
        self.explainSecondLbl.text = "떡상 or 떡락"
        self.explainSecondLbl.textColor = .lightGray
    }
    // MARK: 버튼 비활성화 UIColor
    // 흙/동수저인 경우, 아예 비활성화
    func cantSecondBtn() {
        self.activeSecondBtn.isEnabled = false
        self.thirdSkillView.backgroundColor = .darkGray
        self.activeSecondBtn.setTitle("이용불가", for: .normal)
        self.activeSecondBtn.setTitleColor(.lightGray, for: .normal)
        self.explainSecondLbl.text = "은수저 이상"
        self.explainSecondLbl.textColor = .lightGray
    }
    // MARK: 버튼 활성화 UIColor
    // 비활성화 상태에서 시간이 지나고 다시 UI 바꿔주기
    func setSecondBtn() {
        self.thirdSkillView.backgroundColor = .systemYellow
        self.activeSecondBtn.setTitle("비트코인", for: .normal)
        self.activeSecondBtn.setTitleColor(.magenta, for: .normal)
        self.explainSecondLbl.text = "💵 - 3000$\n💵 + ??$ / 3분"
        self.explainSecondLbl.textColor = .magenta
        self.activeSecondBtn.isEnabled = true
    }
    // MARK: 액티브 비트코인
    func bitCoinFunction()
    {
        let num = arc4random_uniform(10000)
        let result = Int(num) - 4500
        self.money += result
    }
    
    
    
    
    // MARK: 액티브 버튼 3 스레드
    @objc func thirdButtonTapped() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.clickFirstBtn()
            }
            usleep(5000000)
            DispatchQueue.main.async {
                self.difFirstMoney()
                self.afterClickFirstBtn()
                
            }
        }
    }
    
    // MARK: Level에 따른 패널티
    func givePenalty() {
        
    }
    
    
}
