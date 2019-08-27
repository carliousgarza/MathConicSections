//
//  ParabolaD3Controller.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ParabolaD3Controller: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var lbNumH: UILabel!
    @IBOutlet weak var lbNumK: UILabel!
    @IBOutlet weak var lbNumA: UILabel!
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var tfY: UITextField!
    @IBOutlet weak var tfD: UITextField!
    @IBOutlet weak var butAyuda: UIButton!
    
    @IBOutlet weak var butMostrarResultado: UIButton!
    @IBOutlet weak var textViewAyuda: UITextView!
    @IBOutlet weak var imgX: UIImageView!
    @IBOutlet weak var imgY: UIImageView!
    @IBOutlet weak var imgd: UIImageView!
    
     
     
     
     var xnumber : Int!
     var ynumber: Int!
     var y1number: Int!
     var anumber: Int!
     var p: Int!
     var directriz: Int!
    
     
     
     override init(frame: CGRect) {
     super.init(frame: frame)
     xnumber = Int.random(in: -99 ... 100)
     ynumber = Int.random(in: -99 ... 100)
     anumber = Int.random(in: -99 ... 100)
        while anumber % 4 != 0 {
           anumber = Int.random(in: -99 ... 100)
        }
     commonInit()
     }
     
     required init?(coder aDecoder: NSCoder) {
     super.init(coder: aDecoder)
     commonInit()
     }
     func commonInit(){
     
     Bundle.main.loadNibNamed("ParabolaD3", owner: self, options: nil)
     lbNumH?.text = String(xnumber)
     lbNumK?.text = String(ynumber)
     lbNumA?.text = String(anumber)
     addSubview(contentView)
     contentView.frame = self.bounds
     contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     }
     @IBAction func ayuda(_ sender: UIButton) {
     textViewAyuda.isHidden = false
     }
     @IBAction func enviar(_ sender: Any) {
    
     p = (anumber)/4
        if p > 0 {
            directriz = ynumber - p
            y1number = ynumber + p
        }
        else{
            directriz = ynumber - p
            y1number = ynumber + p
        }
        print(directriz)
     var counter = 0
     if tfX.text == String(xnumber){
     counter += 1
     tfX.backgroundColor = UIColor.green
     imgX.image = UIImage(named: "checkmarkIcon")
     }
     else{
     tfX.backgroundColor = UIColor.red
     imgX.image = UIImage(named: "crossIcon")
     }
     if tfY.text == String(y1number){
     counter += 1
     tfY.backgroundColor = UIColor.green
     imgY.image = UIImage(named: "checkmarkIcon")
     }
     else{
     tfY.backgroundColor = UIColor.red
     imgY.image = UIImage(named: "crossIcon")
     }
    if tfD.text == String(directriz){
            counter += 1
            tfD.backgroundColor = UIColor.green
            imgd.image = UIImage(named: "checkmarkIcon")
    }
    else{
        tfD.backgroundColor = UIColor.red
        imgd.image = UIImage(named: "crossIcon")
        }
     
     imgX.isHidden = false
     imgY.isHidden = false
     imgd.isHidden = false
     
     if counter != 3{
     butAyuda.isHidden = false
    butMostrarResultado.isHidden = false
     }
     else{
     textViewAyuda.isHidden = true
     butAyuda.isHidden = true
     butMostrarResultado.isHidden = true
     }
     }
     @IBAction func shuffleValores(_ sender: UIButton) {
     
     xnumber = Int.random(in: -99 ... 100)
     ynumber = Int.random(in: -99 ... 100)
     anumber = Int.random(in: -99 ... 100)
        while anumber % 4 != 0 {
            anumber = Int.random(in: -99 ... 100)
        }
     lbNumH?.text = String(xnumber)
     lbNumK?.text = String(ynumber)
     lbNumA?.text = String(anumber)
     textViewAyuda.isHidden = true
     butAyuda.isHidden = true
     imgX.isHidden = true
     imgY.isHidden = true
     imgd.isHidden = true
     
     tfX.backgroundColor = UIColor.white
     tfY.backgroundColor = UIColor.white
     tfD.backgroundColor = UIColor.white
     tfX.text = ""
     tfY.text = ""
     tfD.text = ""
     butMostrarResultado.isHidden = true
     
     }
    
    @IBAction func mostrarResultado(_ sender: Any) {
        tfX.text = String(xnumber)
        tfY.text = String(y1number)
        tfD.text = String(directriz)
        tfX.backgroundColor = UIColor.yellow
        tfY.backgroundColor = UIColor.yellow
        tfD.backgroundColor = UIColor.yellow
        imgX.isHidden = true
        imgY.isHidden = true
        imgd.isHidden = true
        
        
    }
    
    
    
     
     }

 
 
 

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */


