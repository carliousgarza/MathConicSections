//
//  ParabolaD2InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 11/10/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ParabolaD2InterpretaController: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumX: UILabel?
    @IBOutlet weak var lbNumY: UILabel?
    @IBOutlet weak var directriz: UILabel?
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var imgK: UIImageView!
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var botAyuda: UIButton!
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var imgH: UIImageView!
    
    


 var xnumber : Int!
 var ynumber: Int!
 var dnumber: Int!
 var hnumber: Int!
 var anumber: Int!
 var p: Int!
 
 
 override init(frame: CGRect) {
 super.init(frame: frame)
 xnumber = Int.random(in: -99 ... 100)
 ynumber = Int.random(in: -99 ... 100)
 dnumber = Int.random(in: -99 ... 100)

 commonInit()
 }
 
 required init?(coder aDecoder: NSCoder) {
 super.init(coder: aDecoder)
 commonInit()
 }
 func commonInit(){
 
 Bundle.main.loadNibNamed("ParabolaD2Interpreta", owner: self, options: nil)
 lbNumX?.text = String(xnumber)
 lbNumY?.text = String(ynumber)
 directriz?.text = String(dnumber)

 addSubview(contentView)
 contentView.frame = self.bounds
 contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
 }
 @IBAction func ayuda(_ sender: UIButton) {
 txtViewAyuda.isHidden = false
 }
 @IBAction func enviar(_ sender: Any) {
 
 
 
 
 
 p = (dnumber - xnumber)/2
    
    if p > 0{
        hnumber = xnumber + p
    }
    else {
        hnumber = dnumber + p
    }
 anumber = p * 4
 print(anumber)
 var counter = 0
 //X1
 if tfK.text == String(ynumber){
 counter += 1
 tfK.backgroundColor = UIColor.green
 imgK.image = UIImage(named: "checkmarkIcon")
 }
 else{
 tfK.backgroundColor = UIColor.red
 imgK.image = UIImage(named: "crossIcon")
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
 if tfH.text == String(hnumber){
 counter += 1
 tfH.backgroundColor = UIColor.green
 imgH.image = UIImage(named: "checkmarkIcon")
 }
 else{
 tfH.backgroundColor = UIColor.red
 imgH.image = UIImage(named: "crossIcon")
 }
 
 
 imgA.isHidden = false
 imgK.isHidden = false
 imgH.isHidden = false
 if counter != 3{
 botAyuda.isHidden = false
 }
 else{
 txtViewAyuda.isHidden = true
 botAyuda.isHidden = true
 }
 }
 @IBAction func shuffleValores(_ sender: UIButton) {
 
 xnumber = Int.random(in: -99 ... 100)
 ynumber = Int.random(in: -99 ... 100)
 dnumber = Int.random(in: -99 ... 100)
 lbNumX?.text = String(xnumber)
 lbNumY?.text = String(ynumber)
 directriz?.text = String(dnumber)
 txtViewAyuda.isHidden = true
 botAyuda.isHidden = true
 imgA.isHidden = true
 imgH.isHidden = true
 imgK.isHidden = true
 
 
 tfH.backgroundColor = UIColor.white
 tfK.backgroundColor = UIColor.white
 tfA.backgroundColor = UIColor.white
 
 tfA.text = ""
 tfK.text = ""
 tfH.text = ""
 
 }
 
    
    /*// Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
