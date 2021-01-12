//
//  ViewController.swift
//  The Emerald Isle
//
//  Created by UTKARSH VARMA on 2021-01-11.
//

import UIKit
import AVKit
class WelcomeVC: UIViewController {
    
    
    
    
    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    
    @IBOutlet var buttonDesign: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in buttonDesign{
            button.layer.cornerRadius = 25
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.secondarySystemBackground.cgColor
        }
        setUpVideo()
    }
    
    
    //MARK:-View Lifecycle ovverides
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        //Setting up video in the background
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        guard UIApplication.shared.applicationState == .inactive else {
            return
        }
        print("called")
        reloadViewFromNib()
        
    }
    
    //MARK:-Function to setup the backgorund video
    func setUpVideo(){
        
        var backgroundName = ""
        if self.traitCollection.userInterfaceStyle == .dark {
            backgroundName = "backSmoke"
            
        } else {
            backgroundName = "whiteSmoke"
        }
        
        let bundlePath = Bundle.main.path(forResource: backgroundName, ofType: "mp4")
        
        guard bundlePath != nil else {
            return
        }
        
        let url = URL(fileURLWithPath: bundlePath!)
        
        let item = AVPlayerItem(url: url)
        
        videoPlayer = AVPlayer(playerItem: item)
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        videoPlayerLayer?.frame = CGRect(
            x: -self.view.frame.size.width*1.5,
            y: 0, width: self.view.frame.size.width*4,
            height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        videoPlayer?.playImmediately(atRate: 0.2)
    }
    
    
    //MARK:-Function to reload the view to get the new backgorund loaded 
    func reloadViewFromNib() {
        let parent = view.superview
        view.removeFromSuperview()
        view = nil
        parent?.addSubview(view) // This line causes the view to be reloaded
    }
    
    
    
}
