//
//  SplashViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 14/02/2021.
//

import UIKit

class SplashViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var headingLabel: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!

    var page: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let navigation = navigationController?.navigationBar else {return}
        navigation.isHidden = true
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton){
        
        if nextButton.currentImage == UIImage(systemName: "checkmark.circle.fill") {
            performSegue(withIdentifier: "toSignup", sender: self)
        }else {
            self.scrollToPage(page: self.page, animated: true)
            self.page += 1
        }
    }

    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = self.scrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        self.scrollView.scrollRectToVisible(frame, animated: animated)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         
        let pageIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = pageIndex
        
        if pageControl.currentPage == 0 {
            nextButton.setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
            page = 1
        } else if pageControl.currentPage == 1 {
            nextButton.setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
            page = 2
        }else if pageControl.currentPage == 2 {
            nextButton.setImage(UIImage(systemName: "arrow.forward.circle.fill"), for: .normal)
            page = 3
        }else if pageControl.currentPage == 3 {
            nextButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            page = 4
        }
    }
}
