//
//  ParabolaD3InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 11/10/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ParabolaD3InterpretaController: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumY: UILabel?
    @IBOutlet weak var lbNumX: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var txtViewAyuda: UITextView!

    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var imgK: UIImageView!
    @IBOutlet weak var butMostrarResultados: UIButton!
    
 
 
     var xnumber : Double!
     var ynumber: Double!
     var xaux : Double!
     var a: Double!
    
    
     override init(frame: CGRect) {
     super.init(frame: frame)
     xnumber = Double(Int.random(in: 1 ... 25))
     ynumber = Double(Int.random(in: 1 ... 100))
     commonInit()
     }
    
     required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     commonInit()
     }
     func commonInit(){
     
     Bundle.main.loadNibNamed("ParabolaD3Interpreta", owner: self, options: nil)
         lbNumX?.text = String(xnumber)
         lbNumY?.text = String(ynumber)
         addSubview(contentView)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     }
     @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
        butMostrarResultados.isHidden = false
     }
     @IBAction func enviar(_ sender: Any) {
        xaux = (xnumber / 2) * (-1 * xnumber / 2)
        a = 1.0 / Double(ynumber/xaux)
        print(ynumber)
        print(xaux)
        print(a)
     var counter = 0
     //X1
     if tfK.text == String(Int(ynumber)){
         counter += 1
         tfK.backgroundColor = UIColor.green
         imgK.image = UIImage(named: "checkmarkIcon")
     }
     else{
         tfK.backgroundColor = UIColor.red
         imgK.image = UIImage(named: "crossIcon")
     }
     //Y1
     if tfA.text == String(Int(a)){
         counter += 1
         tfA.backgroundColor = UIColor.green
         imgA.image = UIImage(named: "checkmarkIcon")
         }
     else{
         tfA.backgroundColor = UIColor.red
         imgA.image = UIImage(named: "crossIcon")
     }
     //X2
     if tfH.text == "0"{
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
         butAyuda.isHidden = false
     }
     else{
         txtViewAyuda.isHidden = true
         butAyuda.isHidden = true
        butMostrarResultados.isHidden = true
     }
     }
     @IBAction func shuffleValores(_ sender: UIButton) {
     
         xnumber = Double(Int.random(in: 1 ... 25))
         ynumber = Double(Int.random(in: 1 ... 100))
        
         lbNumX?.text = String(xnumber)
         lbNumY?.text = String(ynumber)
        
         txtViewAyuda.isHidden = true
         butAyuda.isHidden = true
         imgA.isHidden = true
         imgH.isHidden = true
         imgK.isHidden = true
        
        
         tfH.backgroundColor = UIColor.white
         tfK.backgroundColor = UIColor.white
         tfA.backgroundColor = UIColor.white
        
         tfA.text = ""
         tfK.text = ""
         tfH.text = ""
     butMostrarResultados.isHidden = true
 }
    @IBAction func mostrarResultado(_ sender: Any) {
        
        tfH.text = "0"
        tfK.text = String(Int(ynumber))
        tfA.text = String(Int(a))
        tfH.backgroundColor = UIColor.yellow
        tfA.backgroundColor = UIColor.yellow
        tfK.backgroundColor = UIColor.yellow
        imgA.isHidden = true
        imgK.isHidden = true
        imgH.isHidden = true
    }
    
}
