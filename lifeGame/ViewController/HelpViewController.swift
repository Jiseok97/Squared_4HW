//
//  HelpViewController.swift
//  lifeGame
//
//  Created by 이지석 on 2021/07/22.
//

import UIKit

var imagesLst = [ "0.png", "1.png", "2.png", "3.png", "4.png", "5.png", "6.png" ]

class HelpViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pageControl.numberOfPages = imagesLst.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .black
        imageView.image = UIImage(named: imagesLst[0])
    }
    
    @IBAction func changePage(_ sender: Any) {
        self.imageView.image = UIImage(named: imagesLst[pageControl.currentPage])
    }
    
    @IBAction func exitBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
