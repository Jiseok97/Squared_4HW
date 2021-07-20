//
//  casinoViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/20.
//

import UIKit

class casinoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
