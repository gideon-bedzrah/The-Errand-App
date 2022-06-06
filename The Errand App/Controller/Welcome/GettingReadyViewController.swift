//
//  GettingReadyViewController.swift
//  The Errand App
//
//  Created by Gideon Bedzrah on 15/04/2021.
//

import UIKit

class GettingReadyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(instantiateHomeScreen), userInfo: nil, repeats: false)
    }
    

    @objc func instantiateHomeScreen() {
        let hVC = self.storyboard?.instantiateViewController(identifier: "mainScreen")
        self.view.window?.rootViewController = hVC
        self.view.window?.makeKeyAndVisible()
    }

}
