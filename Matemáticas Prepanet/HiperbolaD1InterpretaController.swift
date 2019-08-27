//
//  HiperbolaD1Interpreta.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 11/11/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class HiperbolaD1InterpretaController: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbVX: UILabel?
    @IBOutlet weak var lbVY: UILabel?
    @IBOutlet weak var lbCX: UILabel?
    @IBOutlet weak var lbCY: UILabel?
    @IBOutlet weak var lbFX: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var lbFY: UILabel?
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgK: UIImageView!
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var botAyuda: UIButton!
    @IBOutlet weak var txtViewAyuda: UITextView!
    
    var x1number : Int!
    var ynumber: Int!
    var x2number : Int!
    var x3number: Int!
    var anumber: Int!
    var bnumber: Int!
    var cnumber: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        x1number = Int.random(in: -99 ... 100)
        ynumber = Int.random(in: -99 ... 100)
        x2number = Int.random(in: -99 ... 100)
        x3number = Int.random(in: -99 ... 100)
        while(abs(x3number - x1number) < abs(x2number - x1number)){
            x2number = Int.random(in: -99 ... 100)
            x3number = Int.random(in: -99 ... 100)
        }
        commonInit()
    }

     required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          commonInit()
     }
 func commonInit(){

 Bundle.main.loadNibNamed("HiperbolaD1Interpreta", owner: self, options: nil)
    
         lbCX?.text = String(x1number)
         lbCY?.text = String(ynumber)
         lbVX?.text = String(x2number)
         lbVY?.text = String(ynumber)
         lbFX?.text = String(x3number)
         lbFY?.text = String(ynumber)
    
    while(abs(x3number - x1number) < abs(x2number - x1number)){
         x2number = Int.random(in: -99 ... 100)
         x3number = Int.random(in: -99 ... 100)
    }
    
         addSubview(contentView)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
 }
 @IBAction func ayuda(_ sender: UIButton) {
     txtViewAyuda.isHidden = false
 }
 @IBAction func enviar(_ sender: Any) {
     anumber = x2number - x1number
     anumber = anumber * anumber
     cnumber = x3number - x1number
     cnumber = cnumber * cnumber
     bnumber = cnumber - anumber
    
     print(anumber)
     var counter = 0
     //X1
     if tfH.text == String(x1number){
         counter += 1
         tfH.backgroundColor = UIColor.green
         imgH.image = UIImage(named: "checkmarkIcon")
     }
     else{
         tfH.backgroundColor = UIColor.red
         imgH.image = UIImage(named: "crossIcon")
     }
     //Y1
     if tfA.text == String(anumber){
         counter += 1
         tfA.backgroundColor = UIColor.green
         imgA.image = UIImage(named: "checkmarkIcon")
     }
     else{
         tfA.backgroundColor = UIColor.red
         imgA.image = UIImage(named: "crossIcon")
     }
     //X2
     if tfK.text == String(ynumber){
         counter += 1
         tfK.backgroundColor = UIColor.green
         imgK.image = UIImage(named: "checkmarkIcon")
     }
     else{
         tfK.backgroundColor = UIColor.red
         imgK.image = UIImage(named: "crossIcon")
     }
    if tfB.text == String(bnumber){
        counter += 1
        tfB.backgroundColor = UIColor.green
        imgB.image = UIImage(named: "checkmarkIcon")
    }
    else{
        tfB.backgroundColor = UIColor.red
        imgB.image = UIImage(named: "crossIcon")
    }


     imgA.isHidden = false
     imgK.isHidden = false
     imgH.isHidden = false
     imgB.isHidden = false

     if counter != 4{
        botAyuda.isHidden = false
     }
     else{
         txtViewAyuda.isHidden = true
         botAyuda.isHidden = true
     }
 }
 @IBAction func shuffleValores(_ sender: UIButton) {
        x1number = Int.random(in: -99 ... 100)
        ynumber = Int.random(in: -99 ... 100)
        x2number = Int.random(in: -99 ... 100)
        x3number = Int.random(in: -99 ... 100)
        while(abs(x3number - x1number) < abs(x2number - x1number)){
            x2number = Int.random(in: -99 ... 100)
            x3number = Int.random(in: -99 ... 100)
        }
        lbCX?.text = String(x1number)
        lbCY?.text = String(ynumber)
        lbVX?.text = String(x2number)
        lbVY?.text = String(ynumber)
        lbFX?.text = String(x3number)
        lbFY?.text = String(ynumber)
         txtViewAyuda.isHidden = true
         botAyuda.isHidden = true
         imgA.isHidden = true
         imgH.isHidden = true
         imgK.isHidden = true
         imgB.isHidden = true


         tfH.backgroundColor = UIColor.white
         tfK.backgroundColor = UIColor.white
         tfA.backgroundColor = UIColor.white
        tfB.backgroundColor = UIColor.white

         tfA.text = ""
         tfK.text = ""
         tfH.text = ""
        tfB.text = ""

 }

}
 
