//
//  LaunchScreenVC.swift
//  The Emerald Isle
//
//  Created by UTKARSH VARMA on 2021-01-11.
//

import UIKit

class LaunchScreenVC: UIViewController {
    @IBOutlet weak var onLoadAnimation: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        onLoadAnimation.loadGif(name:fileName.loadScreenImage.rawValue )
        Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(gotoMainView), userInfo: nil, repeats: false)
    }

   @objc func gotoMainView(){
    performSegue(withIdentifier: segues.homeScreen.rawValue, sender: self)
        
    }
  
}
