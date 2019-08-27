//
//  ElipseD3Controller.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ElipseD3Controller: UIView {

    @IBOutlet weak var lbNumH: UILabel?
    @IBOutlet weak var lbNumK: UILabel?
    @IBOutlet weak var lbNumA: UILabel?
    @IBOutlet weak var lbNumB: UILabel?
    @IBOutlet weak var textViewAyuda: UITextView!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var imgViewR2: UIImageView!
    @IBOutlet weak var imgViewR3: UIImageView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tfCX: UITextField!
    @IBOutlet weak var tfCY: UITextField!
    @IBOutlet weak var tfF1X: UITextField!
    @IBOutlet weak var tfF1Y: UITextField!
    @IBOutlet weak var tfF2X: UITextField!
    @IBOutlet weak var tfF2Y: UITextField!
    @IBOutlet weak var butMostrarRespuestas: UIButton!
    
    var NumA : Int!
    var NumB : Int!
    var NumH : Int!
    var NumK : Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NumA = Int.random(in: 1 ... 100)
        NumB = Int.random(in: 1 ... 100)
        NumK = Int.random(in: -99 ... 100)
        NumH = Int.random(in: -99 ... 100)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        Bundle.main.loadNibNamed("ElipseD3", owner: self, options: nil)
        lbNumK?.text = String(NumK)
        lbNumH?.text = String(NumH)
        lbNumA?.text = String(NumA)
        lbNumB?.text = String(NumB)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func ayuda(_ sender: UIButton) {
        textViewAyuda.isHidden = false
        butMostrarRespuestas.isHidden = false
    }
    
    @IBAction func handleMostrarRespuestas(_ sender: UIButton) {
        if NumA*NumA>NumB*NumB {
            let cx = NumH!
            let cy = NumK!
            let valorc = Int(round(sqrt(Double(pow(Double(NumA),2.0)-pow(Double(NumB),2.0)))))
            let f1x = NumH - valorc
            let f1y = NumK!
            let f2x = NumH + valorc
            let f2y = NumK!
            
            tfCX.text = String(cx)
            tfCY.text = String(cy)
            tfF1X.text = String(f1x)
            tfF1Y.text = String(f1y)
            tfF2X.text = String(f2x)
            tfF2Y.text = String(f2y)
            tfCX.backgroundColor = UIColor.yellow
            tfCY.backgroundColor = UIColor.yellow
            tfF1X.backgroundColor = UIColor.yellow
            tfF1Y.backgroundColor = UIColor.yellow
            tfF2X.backgroundColor = UIColor.yellow
            tfF2Y.backgroundColor = UIColor.yellow
            
            imgViewR.isHidden = true
            imgViewR2.isHidden = true
            imgViewR3.isHidden = true
            
        }
        else {
            let cx = NumH!
            let cy = NumK!
            let valorc = Int(round(sqrt(Double(pow(Double(NumB),2.0)-pow(Double(NumA),2.0)))))
            let f1x = NumH!
            let f1y = NumK + valorc
            let f2x = NumH!
            let f2y = NumK - valorc
            
            tfCX.text = String(cx)
            tfCY.text = String(cy)
            tfF1X.text = String(f1x)
            tfF1Y.text = String(f1y)
            tfF2X.text = String(f2x)
            tfF2Y.text = String(f2y)
            tfCX.backgroundColor = UIColor.yellow
            tfCY.backgroundColor = UIColor.yellow
            tfF1X.backgroundColor = UIColor.yellow
            tfF1Y.backgroundColor = UIColor.yellow
            tfF2X.backgroundColor = UIColor.yellow
            tfF2Y.backgroundColor = UIColor.yellow
            
            imgViewR.isHidden = true
            imgViewR2.isHidden = true
            imgViewR3.isHidden = true
        }
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        
        var counter = 0
        
        if NumA*NumA>NumB*NumB {
            // es horizontal
            // el centro es (h,k)
            // los focos son h-c y h+c
            
            let cx = NumH!
            let cy = NumK!
            let valorc = Int(round(sqrt(Double(pow(Double(NumA),2.0)-pow(Double(NumB),2.0)))))
            let f1x = NumH - valorc
            let f1y = NumK!
            let f2x = NumH + valorc
            let f2y = NumK!
            
            if tfCX.text == String(cx) && tfCY.text == String(cy){
                tfCX.backgroundColor = UIColor.green
                tfCY.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
                counter+=1
            }
            else if tfCX.text == String(cx) && tfCY.text != String(cy) {
                tfCX.backgroundColor = UIColor.green
                tfCY.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else if tfCX.text != String(cx) && tfCY.text == String(cy) {
                tfCX.backgroundColor = UIColor.red
                tfCY.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else {
                tfCX.backgroundColor = UIColor.red
                tfCY.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfF1X.text == String(f1x) && tfF1Y.text == String(f1y) {
                tfF1X.backgroundColor = UIColor.green
                tfF1Y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
                counter+=1
            }
            else if tfF1X.text == String(f1x) && tfF1Y.text != String(f1y) {
                tfF1X.backgroundColor = UIColor.green
                tfF1Y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else if tfF1X.text != String(f1x) && tfF1Y.text == String(f1y) {
                tfF1X.backgroundColor = UIColor.red
                tfF1Y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfF1X.backgroundColor = UIColor.red
                tfF1Y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfF2X.text == String(f2x) && tfF2Y.text == String(f2y) {
                tfF2X.backgroundColor = UIColor.green
                tfF2Y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
                counter+=1
            }
            else if tfF2X.text == String(f2x) && tfF2Y.text != String(f2y) {
                tfF2X.backgroundColor = UIColor.green
                tfF2Y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else if tfF2X.text != String(f2x) && tfF2Y.text == String(f2y) {
                tfF2X.backgroundColor = UIColor.red
                tfF2Y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfF2X.backgroundColor = UIColor.red
                tfF2Y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
        }
        else {
            // es vertical
            // el centro es (h,k)
            // los focos son (k-c) y (k+c)
            
            let cx = NumH!
            let cy = NumK!
            let valorc = Int(round(sqrt(Double(pow(Double(NumB),2.0)-pow(Double(NumA),2.0)))))
            let f1x = NumH!
            let f1y = NumK + valorc
            let f2x = NumH!
            let f2y = NumK - valorc
            
            if tfCX.text == String(cx) && tfCY.text == String(cy){
                tfCX.backgroundColor = UIColor.green
                tfCY.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
                counter+=1
            }
            else if tfCX.text == String(cx) && tfCY.text != String(cy) {
                tfCX.backgroundColor = UIColor.green
                tfCY.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else if tfCX.text != String(cx) && tfCY.text == String(cy) {
                tfCX.backgroundColor = UIColor.red
                tfCY.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else {
                tfCX.backgroundColor = UIColor.red
                tfCY.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfF1X.text == String(f1x) && tfF1Y.text == String(f1y) {
                tfF1X.backgroundColor = UIColor.green
                tfF1Y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
                counter+=1
            }
            else if tfF1X.text == String(f1x) && tfF1Y.text != String(f1y) {
                tfF1X.backgroundColor = UIColor.green
                tfF1Y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else if tfF1X.text != String(f1x) && tfF1Y.text == String(f1y) {
                tfF1X.backgroundColor = UIColor.red
                tfF1Y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfF1X.backgroundColor = UIColor.red
                tfF1Y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfF2X.text == String(f2x) && tfF2Y.text == String(f2y) {
                tfF2X.backgroundColor = UIColor.green
                tfF2Y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
                counter+=1
            }
            else if tfF2X.text == String(f2x) && tfF2Y.text != String(f2y) {
                tfF2X.backgroundColor = UIColor.green
                tfF2Y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else if tfF2X.text != String(f2x) && tfF2Y.text == String(f2y) {
                tfF2X.backgroundColor = UIColor.red
                tfF2Y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfF2X.backgroundColor = UIColor.red
                tfF2Y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
        }
        if counter != 3 {
            butAyuda.isHidden = false
        } else {
            textViewAyuda.isHidden = true
            butAyuda.isHidden = true
            butMostrarRespuestas.isHidden = true

        }
    }
    
    @IBAction func shuffleValores(_ sender: UIButton) {
        NumA = Int.random(in: 1 ... 100)
        NumB = Int.random(in: 1 ... 100)
        NumK = Int.random(in: -99 ... 100)
        NumH = Int.random(in: -99 ... 100)
        
        lbNumK?.text = String(NumK)
        lbNumH?.text = String(NumH)
        lbNumA?.text = String(NumA)
        lbNumB?.text = String(NumB)
        
        textViewAyuda.isHidden = true
        butAyuda.isHidden = true
        
        imgViewR.isHidden = true
        imgViewR2.isHidden = true
        imgViewR3.isHidden = true
        
        tfCX.backgroundColor = UIColor.white
        tfCY.backgroundColor = UIColor.white
        tfF1X.backgroundColor = UIColor.white
        tfF1Y.backgroundColor = UIColor.white
        tfF2X.backgroundColor = UIColor.white
        tfF2Y.backgroundColor = UIColor.white
        
        tfCX.text = ""
        tfCY.text = ""
        tfF1X.text = ""
        tfF1Y.text = ""
        tfF2X.text = ""
        tfF2Y.text = ""
        
        butMostrarRespuestas.isHidden = true
    }
}
