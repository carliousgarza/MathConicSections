//
//  ElipseD1InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ElipseD1InterpretaController: UIView {

    @IBOutlet weak var lbV1X: UILabel?
    @IBOutlet weak var lbV1Y: UILabel?
    @IBOutlet weak var lbV2X: UILabel?
    @IBOutlet weak var lbV2Y: UILabel?
    @IBOutlet weak var lbCv1X: UILabel?
    @IBOutlet weak var lbCv1Y: UILabel?
    @IBOutlet weak var lbCv2X: UILabel?
    @IBOutlet weak var lbCv2Y: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var imgViewR2: UIImageView!
    @IBOutlet weak var imgViewR3: UIImageView!
    @IBOutlet weak var imgViewR4: UIImageView!
    @IBOutlet weak var textViewAyuda: UITextView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet var contentView: UIView!
    
    var v1x : Int = 0
    var v1y : Int = 0
    var v2x : Int = 0
    var v2y : Int = 0
    var cv1x : Int = 0
    var cv1y : Int = 0
    var cv2x : Int = 0
    var cv2y : Int = 0
    
    @IBAction func ayuda(_ sender: UIButton) {
        textViewAyuda.isHidden = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let esvertical = Int.random(in: 1...2)
        
        if esvertical == 1 {
            let xc = Int.random(in: -30...30)
            let yc = Int.random(in: -30...30)
            let disty = Int.random(in: 50...99)
            let distx = Int.random(in: 1...49)
            v1x = xc
            v1y = yc + disty
            v2x = xc
            v2y = yc - disty
            cv1x = xc - distx
            cv1y = yc
            cv2x = xc + distx
            cv2y = yc
        }
        else {
            let xc = Int.random(in: -30...30)
            let yc = Int.random(in: -30...30)
            let disty = Int.random(in: 1...49)
            let distx = Int.random(in: 50...99)
            v1x = xc
            v1y = yc + disty
            v2x = xc
            v2y = yc - disty
            cv1x = xc - distx
            cv1y = yc
            cv2x = xc + distx
            cv2y = yc
        }
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
        Bundle.main.loadNibNamed("ElipseD1Interpreta", owner: self, options: nil)
        
        lbV1X?.text = String(v1x)
        lbV1Y?.text = String(v1y)
        lbV2X?.text = String(v2x)
        lbV2Y?.text = String(v2y)
        lbCv1X?.text = String(cv1x)
        lbCv1Y?.text = String(cv1y)
        lbCv2X?.text = String(cv2x)
        lbCv2Y?.text = String(cv2y)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func handleEnviar(_ sender: UIButton) {
       var count = 0
        
        if v1x == v2x {
            // es vertical
            if tfH.text == String(v1x) {
                count+=1
                tfH.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
            }
            else {
                tfH.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfK.text == String(cv1y) {
                count+=1
                tfK.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfK.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfA.text == String(cv2x-v1x) {
                count+=1
                tfA.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfA.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
            if tfB.text == String(v1y-cv2y) {
                count+=1
                tfB.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "checkmark")
                imgViewR4.isHidden = false
            }
            else {
                tfB.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
            
        }
        else {
            // es horizontal
            if tfH.text == String(cv1x) {
                count+=1
                tfH.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
            }
            else {
                tfH.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfK.text == String(v1y) {
                count+=1
                tfK.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfK.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfA.text == String(cv2x-v1x) {
                count+=1
                tfA.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfA.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
            if tfB.text == String(v1y-cv2y) {
                count+=1
                tfB.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR4.isHidden = false
            }
            else {
                tfB.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
        }
        
        if count != 4 {
            butAyuda.isHidden = false
        } else {
            textViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        
    }
    
    @IBAction func shuffleValores(_ sender: UIButton) {
        let esvertical = Int.random(in: 1...2)
        
        if esvertical == 1 {
            let xc = Int.random(in: -30...30)
            let yc = Int.random(in: -30...30)
            let disty = Int.random(in: 50...99)
            let distx = Int.random(in: 1...49)
            v1x = xc
            v1y = yc + disty
            v2x = xc
            v2y = yc - disty
            cv1x = xc - distx
            cv1y = yc
            cv2x = xc + distx
            cv2y = yc
        }
        else {
            let xc = Int.random(in: -30...30)
            let yc = Int.random(in: -30...30)
            let disty = Int.random(in: 1...49)
            let distx = Int.random(in: 50...99)
            v1x = xc - distx
            v1y = yc
            v2x = xc + distx
            v2y = yc
            cv1x = xc
            cv1y = yc + disty
            cv2x = xc
            cv2y = yc - disty
        }
        
        lbV1X?.text = String(v1x)
        lbV1Y?.text = String(v1y)
        lbV2X?.text = String(v2x)
        lbV2Y?.text = String(v2y)
        lbCv1X?.text = String(cv1x)
        lbCv1Y?.text = String(cv1y)
        lbCv2X?.text = String(cv2x)
        lbCv2Y?.text = String(cv2y)
        
        textViewAyuda.isHidden = true
        butAyuda.isHidden = true
        
        imgViewR.isHidden = true
        imgViewR2.isHidden = true
        imgViewR3.isHidden = true
        imgViewR4.isHidden = true
        
        tfA.backgroundColor = UIColor.white
        tfB.backgroundColor = UIColor.white
        tfH.backgroundColor = UIColor.white
        tfK.backgroundColor = UIColor.white

        tfA.text = ""
        tfB.text = ""
        tfK.text = ""
        tfH.text = ""
    }
}
