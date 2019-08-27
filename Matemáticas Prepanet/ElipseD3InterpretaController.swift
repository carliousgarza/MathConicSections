//
//  ElipseD3InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/12/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ElipseD3InterpretaController: UIView {

    @IBOutlet weak var lbV1X: UILabel?
    @IBOutlet weak var lbV1Y: UILabel?
    @IBOutlet weak var lbV2X: UILabel?
    @IBOutlet weak var lbV2Y: UILabel?
    @IBOutlet weak var lbF1X: UILabel?
    @IBOutlet weak var lbF1Y: UILabel?
    @IBOutlet weak var lbF2X: UILabel?
    @IBOutlet weak var lbF2Y: UILabel?
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
    @IBOutlet weak var buttonMostrarRespuesta: UIButton!
    
    var v1x : Int = 0
    var v1y : Int = 0
    var v2x : Int = 0
    var v2y : Int = 0
    var f1x : Int = 0
    var f1y : Int = 0
    var f2x : Int = 0
    var f2y : Int = 0
    var xc : Int = 0
    var yc : Int = 0
    var distv : Int = 0
    var distf : Int = 0
    var a2 : Int = 0
    var b2 : Int = 0
    var c2 : Int = 0
    
    @IBAction func ayuda(_ sender: UIButton) {
        textViewAyuda.isHidden = false
        buttonMostrarRespuesta.isHidden = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let esvertical = Int.random(in: 1...2)
        
        if esvertical == 1 {
            xc = Int.random(in: -30...30)
            yc = Int.random(in: -30...30)
            distv = Int.random(in: 10...50)
            distf = Int.random(in: 3...9)
            v1x = xc
            v1y = yc + distv
            v2x = xc
            v2y = yc - distv
            f1x = xc
            f1y = yc + distf
            f2x = xc
            f2y = yc - distf
        }
        else {
            xc = Int.random(in: -30...30)
            yc = Int.random(in: -30...30)
            distv = Int.random(in: 10...50)
            distf = Int.random(in: 3...9)
            v1x = xc - distv
            v1y = yc
            v2x = xc + distv
            v2y = yc
            f1x = xc - distf
            f1y = yc
            f2x = xc + distf
            f2y = yc
        }
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
        Bundle.main.loadNibNamed("ElipseD3Interpreta", owner: self, options: nil)
        
        lbV1X?.text = String(v1x)
        lbV1Y?.text = String(v1y)
        lbV2X?.text = String(v2x)
        lbV2Y?.text = String(v2y)
        lbF1X?.text = String(f1x)
        lbF1Y?.text = String(f1y)
        lbF2X?.text = String(f2x)
        lbF2Y?.text = String(f2y)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func handleEnviar(_ sender: UIButton) {
        var count = 0
        
        if v1x == v2x {
            // es vertical
            
            let c = f1y - yc
            let a = v1y - yc
            a2 = a*a
            c2 = c*c
            b2 = a2-c2

            if tfH.text == String(xc) {
                tfH.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
                count+=1
            }
            else {
                tfH.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfK.text == String(yc) {
                tfK.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
                count+=1
            }
            else {
                tfK.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }

            if tfA.text == String(b2) {
                tfA.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
                count+=1
            }
            else {
                tfA.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
            if tfB.text == String(distv*distv) {
                tfB.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR4.isHidden = false
                count+=1
            }
            else {
                tfB.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
        }
        else {
            // es horizontal
            
            let c = f1x - xc
            let a = v1x - xc
            a2 = a*a
            c2 = c*c
            b2 = a2-c2
            
            if tfH.text == String(xc) {
                tfH.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
                count+=1
            }
            else {
                tfH.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfK.text == String(yc) {
                tfK.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
                count+=1
            }
            else {
                tfK.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfA.text == String(distv * distv) {
                tfA.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
                count+=1
            }
            else {
                tfA.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
            if tfB.text == String(b2) {
                tfB.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR4.isHidden = false
                count+=1
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
    
    @IBAction func handleMostrarRespuestas(_ sender: UIButton) {
        if v1x == v2x {
            //es vertical
            tfH.text = String(xc)
            tfK.text = String(yc)
            tfA.text = String(b2)
            tfB.text = String(distv * distv)
            tfH.backgroundColor = UIColor.yellow
            tfK.backgroundColor = UIColor.yellow
            tfA.backgroundColor = UIColor.yellow
            tfB.backgroundColor = UIColor.yellow
            imgViewR.isHidden = true
            imgViewR2.isHidden = true
            imgViewR3.isHidden = true
            imgViewR4.isHidden = true
        }
        else {
            //es horizontal
            tfH.text = String(xc)
            tfK.text = String(yc)
            tfA.text = String(distv * distv)
            tfB.text = String(b2)
            tfH.backgroundColor = UIColor.yellow
            tfK.backgroundColor = UIColor.yellow
            tfA.backgroundColor = UIColor.yellow
            tfB.backgroundColor = UIColor.yellow
            imgViewR.isHidden = true
            imgViewR2.isHidden = true
            imgViewR3.isHidden = true
            imgViewR4.isHidden = true
        }
    }
    
    
    @IBAction func shuffleValores(_ sender: UIButton) {
        let esvertical = Int.random(in: 1...2)
        
        if esvertical == 1 {
            xc = Int.random(in: -30...30)
            yc = Int.random(in: -30...30)
            distv = Int.random(in: 10...50)
            distf = Int.random(in: 3...9)
            v1x = xc
            v1y = yc + distv
            v2x = xc
            v2y = yc - distv
            f1x = xc
            f1y = yc + distf
            f2x = xc
            f2y = yc - distf
        }
        else {
            xc = Int.random(in: -30...30)
            yc = Int.random(in: -30...30)
            distv = Int.random(in: 10...50)
            distf = Int.random(in: 3...9)
            v1x = xc - distv
            v1y = yc
            v2x = xc + distv
            v2y = yc
            f1x = xc - distf
            f1y = yc
            f2x = xc + distf
            f2y = yc
        }
        
        lbV1X?.text = String(v1x)
        lbV1Y?.text = String(v1y)
        lbV2X?.text = String(v2x)
        lbV2Y?.text = String(v2y)
        lbF1X?.text = String(f1x)
        lbF1Y?.text = String(f1y)
        lbF2X?.text = String(f2x)
        lbF2Y?.text = String(f2y)
        
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
