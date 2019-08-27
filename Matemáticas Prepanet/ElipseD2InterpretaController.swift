//
//  ElipseD2InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ElipseD2InterpretaController: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbVerticeX: UILabel?
    @IBOutlet weak var lbVerticeY: UILabel?
    @IBOutlet weak var lbFocoX: UILabel?
    @IBOutlet weak var lbFocoY: UILabel?
    @IBOutlet weak var lbCentroX: UILabel?
    @IBOutlet weak var lbCentroY: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var imgViewR2: UIImageView!
    @IBOutlet weak var imgViewR3: UIImageView!
    @IBOutlet weak var imgViewR4: UIImageView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var textViewAyuda: UITextView!
    
    var cx : Int = 0
    var cy : Int = 0
    var vx : Int = 0
    var vy : Int = 0
    var fx : Int = 0
    var fy : Int = 0

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
            cx = Int.random(in: -99...100)
            cy = Int.random(in: -99...100)
            vx = cx
            fx = cx
            vy = Int.random(in: 20...50) + cy
            fy = vy - Int.random(in: 5...10)
        }
        else {
            cx = Int.random(in: -99...100)
            cy = Int.random(in: -99...100)
            vx = Int.random(in: 20...50) + cx
            fx = vx - Int.random(in: 5...10)
            vy = cy
            fy = cy
        }
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
        Bundle.main.loadNibNamed("ElipseD2Interpreta", owner: self, options: nil)
        
        lbVerticeX?.text = String(vx)
        lbVerticeY?.text = String(vy)
        lbFocoX?.text = String(fx)
        lbFocoY?.text = String(fy)
        lbCentroX?.text = String(cx)
        lbCentroY?.text = String(cy)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func handleEnviar(_ sender: UIButton) {
        
        var count = 0
        
        if lbVerticeX!.text == lbFocoX!.text {
            //  es vertical
            let c = fy - cy
            let a = vy - cy
            let a2 = a*a
            let c2 = c*c
            let b2 = a2-c2
            
            if tfH.text == lbCentroX?.text {
                count += 1
                tfH.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
            }
            else {
                tfH.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            if tfK.text == lbCentroY?.text {
                count += 1
                tfK.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfK.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            if tfA.text == String(b2) {
                count += 1
                tfA.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfA.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            if tfB.text == String(a2) {
                count += 1
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
        else {
            //  es horizontal
            
            let c = fx - cx
            let a = vx - cx
            let a2 = a*a
            let c2 = c*c
            let b2 = a2-c2
            
            if tfH.text == lbCentroX?.text {
                count += 1
                tfH.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
            }
            else {
                tfH.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            if tfK.text == lbCentroY?.text {
                count += 1
                tfK.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfK.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            if tfA.text == String(a2) {
                count += 1
                tfA.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfA.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            if tfB.text == String(b2) {
                count += 1
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
            cx = Int.random(in: -99...100)
            cy = Int.random(in: -99...100)
            vx = cx
            fx = cx
            vy = Int.random(in: 20...50) + cy
            fy = vy - Int.random(in: 5...10)
        }
        else {
            cx = Int.random(in: -99...100)
            cy = Int.random(in: -99...100)
            vx = Int.random(in: 20...50) + cx
            fx = vx - Int.random(in: 5...10)
            vy = cy
            fy = cy
        }
        
        lbVerticeX?.text = String(vx)
        lbVerticeY?.text = String(vy)
        lbFocoX?.text = String(fx)
        lbFocoY?.text = String(fy)
        lbCentroX?.text = String(cx)
        lbCentroY?.text = String(cy)
        
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
