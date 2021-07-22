//
//  ViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/19.
//

// MARK: 각 액티브 버튼마다 시간 제한 확인하기 !
// 동 -> 은 갈 때, 비트코인 버튼 초기화


import UIKit

class ViewController: UIViewController, sendMoney {
    
    func dataSend(fee: Int, get: Int) {
        self.money -= fee
        self.money += get
        self.showToast(message: "💵 + \(get)$")
    }
    
    
    // MARK: Header UIViews
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var moneyView: UIView!
    // Mid View
    @IBOutlet weak var midView: UIView!
    // Character Background
    @IBOutlet weak var charBgImage: UIImageView!
    
    
    
    
    // MARK: Head Prop
    @IBOutlet weak var levleTextLbl: UILabel!
    @IBOutlet weak var moneyLbl: UILabel!
    @IBOutlet weak var characterImg: UIImageView!
    var money : Int = 16001
    var richCnt : Int = 0
    
    
    
    
    // MARK: 패시브 스킬 UIView
    @IBOutlet weak var firstSkillView: UIView!
    @IBOutlet weak var passiveImg: UIImageView!
    @IBOutlet weak var paasiveNameLbl: UILabel!
    @IBOutlet weak var passiveLbl: UILabel!
    

    
    // MARK: 액티브 기능1 UIView
    @IBOutlet weak var secondSkillView: UIView!
    @IBOutlet weak var activeImg: UIImageView!
    @IBOutlet weak var activeSkillBtn: UIButton!
    @IBOutlet weak var activeExplainLbl: UILabel!
    
    
    // MARK: 액티브 기능2 UIView
    @IBOutlet weak var thirdSkillView: UIView!
    @IBOutlet weak var activeSecondImg: UIImageView!
    @IBOutlet weak var activeSecondBtn: UIButton!
    @IBOutlet weak var explainSecondLbl: UILabel!
    
    
    
    // MARK: 액티브 기능3 UIView
    @IBOutlet weak var fourthSkillView: UIView!
    @IBOutlet weak var casinoImg: UIImageView!
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
        
        self.characterImg.layer.zPosition = 999
        self.charBgImage.layer.zPosition = 0
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
                    // 액티브 버튼 3
                    self.activeThirdBtn.addTarget(self, action: #selector(self.thirdButtonTapped), for: .touchUpInside)
                }
            }
        }
    }
    
    
 
    // MARK: 이미지 및 라벨 변경 기능
    func setImage()
    {
        if (self.money <= 5000) {
            self.levleTextLbl.text = "흙수저"
            self.characterImg.image = UIImage(named: "level01")
            self.charBgImage.image = UIImage(named: "bgImglevel1")
            self.passiveImg.image = UIImage(named: "oldPaper")
            self.activeImg.image = UIImage(named: "plzImg")
            self.activeSecondImg.image = UIImage(named: "subWay")
        }
        else if (self.money > 5000 && self.money <= 10000) {
            self.levleTextLbl.text = "동수저"
            self.characterImg.image = UIImage(named: "level02")
            self.charBgImage.image = UIImage(named: "bgImgLevel2")
            self.passiveImg.image = UIImage(named: "bankPaper")
            self.activeImg.image = UIImage(named: "partTime")
            self.activeSecondImg.image = UIImage(named: "teach")
        }
        else if (self.money > 10000 && self.money <= 15000) {
            self.levleTextLbl.text = "은수저"
            self.characterImg.image = UIImage(named: "level03")
            self.charBgImage.image = UIImage(named: "bgImgLevel3")
            self.passiveImg.image = UIImage(named: "payday")
            self.activeImg.image = UIImage(named: "nightWork")
            self.activeSecondImg.image = UIImage(named: "twoJob")
        }
        else if (self.money > 15000){
            self.levleTextLbl.text = "금수저"
            self.characterImg.image = UIImage(named: "level04")
            self.charBgImage.image = UIImage(named: "bgImgLevel4")
            self.passiveImg.image = UIImage(named: "breath")
            self.activeImg.image = UIImage(named: "building")
            self.activeSecondImg.image = UIImage(named: "buildingUpgrade")
        }
    }

    
    
    
    // MARK: LEVEL 차별화
    func passiveSkill()
    {
        
        DispatchQueue.main.async {
            
            if (self.levleTextLbl.text == "흙수저") {
                self.money += 1
                self.paasiveNameLbl.text = "폐지 줍기"
                self.passiveLbl.text = "💵 + 1$ / 1초"
                self.passiveLbl.textColor = .black
                self.levleTextLbl.textColor = .black
                
                // 액티브 1
                self.activeSkillBtn.setTitle("구   걸", for: .normal)
                self.activeExplainLbl.text = "💵 + 100$ / 10초"
                
                // 액티브 2
                self.activeSecondBtn.setTitle("전철 구걸", for: .normal)
                self.explainSecondLbl.text = "💵 + 500$ / 1분"
                
            }
            
            
            else if (self.levleTextLbl.text == "동수저") {
                self.money += 10
                self.paasiveNameLbl.text = "통장 이자"
                self.headView.backgroundColor =  UIColor(displayP3Red: 246/255, green: 228/255, blue: 210/255, alpha: 1)
                self.midView.backgroundColor =  UIColor(displayP3Red: 246/255, green: 228/255, blue: 210/255, alpha: 1)
                self.levleTextLbl.textColor = .brown
                self.passiveLbl.text = "💵 + 10$ / 1초"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("아르바이트", for: .normal)
                self.activeExplainLbl.text = "💵 + 300$ / 10초"
                
                // 액티브 2
                self.activeSecondBtn.setTitle("과 외", for: .normal)
                self.explainSecondLbl.text = "💵 + 1000$/1분"
                
            }
            
            
            else if (self.levleTextLbl.text == "은수저") {
                self.money += 150
                self.paasiveNameLbl.text = "월 급"
                self.levleTextLbl.textColor = .systemGray
                self.headView.backgroundColor = UIColor(displayP3Red: 30/255, green: 48/255, blue: 75/255, alpha: 1)
                self.midView.backgroundColor = UIColor(displayP3Red: 30/255, green: 48/255, blue: 75/255, alpha: 1)
                
                self.passiveLbl.text = "💵 + 150$ / 1초"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("야 근", for: .normal)
                self.activeExplainLbl.text = "💵 + 750$ / 10초"
                
                // 액티브 2
                self.activeSecondBtn.setTitle("투 잡", for: .normal)
                self.explainSecondLbl.text = "💵 + 3000$/1분"
                
               
            }
            
            
            else if (self.levleTextLbl.text == "금수저") {
                self.setRich()
                self.paasiveNameLbl.text = "숨 쉬 기"
                self.levleTextLbl.textColor = .systemYellow
                self.headView.backgroundColor = UIColor(displayP3Red: 30/255, green: 48/255, blue: 75/255, alpha: 1)
                self.midView.backgroundColor = UIColor(displayP3Red: 30/255, green: 48/255, blue: 75/255, alpha: 1)
                self.passiveLbl.text = "💵 + 500$/1초"
                
                // 액티브 1
                self.activeSkillBtn.setTitle("건물 올리기", for: .normal)
                self.activeExplainLbl.text = "💵 - 3000$\n패시브+500$(누적)"
                
                // 액티브 2
                self.activeSecondBtn.setTitle("월세 올리기", for: .normal)
                self.explainSecondLbl.text = "💵 + 5000$/1분"
                
                // 액티브 3
                self.forHighLevel()
            }
        }
    }
    
    // MARK: 금수저 액티브1 패시브 돈 누적시키기
    func setRich()
    {
        self.money += 500 + (500 * self.richCnt)
    }
 
    
    
    // MARK: Toast Message
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 14.0)) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 90, y: self.view.frame.size.height - 65, width: 190, height: 45))
        
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.systemBlue
        toastLabel.font = UIFont.boldSystemFont(ofSize: 16)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 10.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview() }) }
    
    
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
        self.activeExplainLbl.textColor = .lightGray
    }
    // MARK: 액티브 버튼 1 클릭 후
    func afterClickFirstBtn()
    {
        self.activeSkillBtn.setTitleColor(.black, for: .normal)
        self.activeExplainLbl.textColor = .black
        self.activeSkillBtn.isEnabled = true
    }
    // MARK: 액티브 버튼 1 버는 돈
    func difFirstMoney() {
        if (self.levleTextLbl.text == "흙수저") {
            self.money += 100
            self.showToast(message: "💵 + 100$")
        }
        else if (self.levleTextLbl.text == "동수저") {
            self.money += 300
            self.showToast(message: "💵 + 300$")
        }
        else if (self.levleTextLbl.text == "은수저") {
            self.money += 750
            self.showToast(message: "💵 + 750$")
        }
        else if (self.levleTextLbl.text == "금수저") {
            self.money -= 3000
            self.richCnt += 1
            self.showToast(message: "숨쉬기 💵 + 500$")
        }
        
    }
    

    
    
    
    // MARK: 액티브 버튼 2 스레드
    @objc func secondButtonTapped() {
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.main.async {
                self.clickSecondBtn()
            }
            usleep(10000000) // 1분으로 할 예정
            DispatchQueue.main.async {
                self.setSecondBtn()
                self.difSecondMoney()
            }
        }
    }
    // MARK: 액티브 버튼 2 클릭
    func clickSecondBtn() {
        self.activeSecondBtn.isEnabled = false
        self.activeSecondBtn.tintColor = .systemGray
        self.activeSecondBtn.setTitleColor(.lightGray, for: .normal)
        self.explainSecondLbl.textColor = .lightGray
    }

    // MARK: 액티브 버튼 2 클릭 후
    func setSecondBtn() {
        self.activeSecondBtn.setTitleColor(.black, for: .normal)
        self.explainSecondLbl.textColor = .black
        self.activeSecondBtn.isEnabled = true
    }
    // MARK: 액티브 버튼 2 버는 돈
    func difSecondMoney() {
        if (self.levleTextLbl.text == "흙수저") {
            self.money += 500
            self.showToast(message: "💵 + 500$")
        }
        else if (self.levleTextLbl.text == "동수저") {
            self.money += 1000
            self.showToast(message: "💵 + 1000$")
        }
        else if (self.levleTextLbl.text == "은수저") {
            self.money += 3000
            self.showToast(message: "💵 + 3000$")
        }
        else if (self.levleTextLbl.text == "금수저") {
            self.money += 5000
            self.showToast(message: "💵 + 5000$")
        }
        
    }
    
    
    
    
    
    // MARK: 액티브 버튼 3 스레드
    @objc func thirdButtonTapped() {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.async {
                self.onlyGold()
            }
        }
    }
    
    // MARK: Level 차별화 기능
    func onlyGold() {
       if (self.levleTextLbl.text == "금수저") {
            let storyboard: UIStoryboard = UIStoryboard(name: "casino", bundle: nil)
            guard let nextView = storyboard.instantiateViewController(identifier: "casinoViewController") as? casinoViewController else {fatalError()}
            nextView.delegate = self
            present(nextView, animated: true, completion: nil)
        }
       else {
        self.showToast(message: "금수저만 이용 가능합니다")
       }
    }

    
    // MARK: 금수저 전용 UIView
    func forHighLevel() {
        self.casinoImg.image = UIImage(named: "casinoBtn")
        self.activeThirdBtn.setTitle("", for: .normal)
        self.explainThirdLbl.text = "카 지 노"
        self.explainThirdLbl.font = UIFont.boldSystemFont(ofSize: 30)
        self.explainThirdLbl.textColor = .black
    }
    
}
