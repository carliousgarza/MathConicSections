//
//  FirstViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 10/2/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    @IBOutlet weak var uiViewSecciones: UIView!
    @IBOutlet weak var uiViewImagen: UIView!
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let theURL = Bundle.main.url(forResource: "chalkboard", withExtension: "mp4")
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = AVPlayer.ActionAtItemEnd.pause
        
        avPlayerLayer.frame = view.layer.bounds
        view.backgroundColor = UIColor.clear
        view.layer.insertSublayer(avPlayerLayer, at: 0)
        /*NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(notification:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)*/
        
        
        
    }
    func fadeInNewImage(newImage: UIImage) {
        let tmpImageView = UIImageView(image: newImage)
        tmpImageView.contentMode = uiViewSecciones.contentMode
        tmpImageView.frame = uiViewSecciones.bounds
        tmpImageView.alpha = 0
        uiViewSecciones.addSubview(tmpImageView)
        UIView.animate(withDuration: 2.75, delay: 1.2, animations: {
            tmpImageView.alpha = 1.0
        }, completion: {
            finished in
            /*self.uiViewSecciones.image = newImage
             tmpImageView.removeFromSuperview()*/
        })
    }
    func fadeInNewImage2(newImage: UIImage) {
        let tmpImageView = UIImageView(image: newImage)
        tmpImageView.contentMode = uiViewImagen.contentMode
        tmpImageView.frame = uiViewImagen.bounds
        tmpImageView.alpha = 0
        uiViewImagen.addSubview(tmpImageView)
        UIView.animate(withDuration: 4.75, delay: 2, animations: {
            tmpImageView.alpha = 1.0
        }, completion: {
            finished in
            /*self.uiViewSecciones.image = newImage
             tmpImageView.removeFromSuperview()*/
        })
    }
    
    func ConstraintsUIViews(){
        
    }
    /*@objc func playerItemDidReachEnd(notification: NSNotification) {
     let p: AVPlayerItem = notification.object as! AVPlayerItem
     p.seek(to: CMTime.zero, completionHandler: nil)
     }*/
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avPlayer.play()
        paused = false
        fadeInNewImage(newImage: UIImage(named: "secciones")!)
        fadeInNewImage2(newImage: UIImage(named: "MathIcons")!)
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

