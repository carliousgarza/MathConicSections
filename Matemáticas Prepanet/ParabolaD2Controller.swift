//
//  CirculoD1Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/6/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ParabolaD2Controller: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumK: UILabel?
    @IBOutlet weak var lbNumA: UILabel?
    @IBOutlet weak var lbNumH: UILabel?
    
    @IBOutlet weak var tfX1: UITextField!
    
    @IBOutlet weak var tfY1: UITextField!
    
    @IBOutlet weak var tfX2: UITextField!
    
    @IBOutlet weak var tfY2: UITextField!

    @IBOutlet weak var botAyuda: UIButton!
    
    @IBOutlet weak var textViewAyuda: UITextView!
    
    @IBOutlet weak var imgX1: UIImageView!
    //
    @IBOutlet weak var imgY1: UIImageView!
    
    @IBOutlet weak var imgX2: UIImageView!
    
    @IBOutlet weak var imgY2: UIImageView!
    
    @IBOutlet weak var butAyuda: UIButton!
    

    @IBOutlet weak var txtViewAyuda: UITextView!
    
    //    @IBOutlet weak var butAyuda: UIButton!
    //    @IBOutlet weak var textViewAyuda: UITextView!
    
    
    var x1number : Int!
    var y1number: Int!
    var x2number : Int!
    var y2number: Int!
    var anumber: Int!
    var p: Int!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        x1number = Int.random(in: -99 ... 100)
        y1number = Int.random(in: -99 ... 100)
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
        
        Bundle.main.loadNibNamed("ParabolaD2", owner: self, options: nil)
        lbNumH?.text = String(x1number)
        lbNumK?.text = String(y1number)
        lbNumA?.text = String(anumber)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
    }
    @IBAction func enviar(_ sender: Any) {
        
        p = anumber/4
        y2number = y1number
        if(p > 0){
            x2number = x1number + p
        }
        else {
            x2number = x1number + p
        }
        var counter = 0
        //X1
        if tfX1.text == String(x1number){
            counter += 1
            tfX1.backgroundColor = UIColor.green
            imgX1.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfX1.backgroundColor = UIColor.red
            imgX1.image = UIImage(named: "crossIcon")
        }
        //Y1
        if tfY1.text == String(y1number){
            counter += 1
            tfY1.backgroundColor = UIColor.green
            imgY1.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfY1.backgroundColor = UIColor.red
            imgY1.image = UIImage(named: "crossIcon")
        }
        //X2
        if tfX2.text == String(x2number){
            counter += 1
            tfX2.backgroundColor = UIColor.green
            imgX2.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfX2.backgroundColor = UIColor.red
            imgX2.image = UIImage(named: "crossIcon")
        }
        if tfY2.text == String(y2number){
            counter += 1
            tfY2.backgroundColor = UIColor.green
            imgY2.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfY2.backgroundColor = UIColor.red
            imgY2.image = UIImage(named: "crossIcon")
        }
        
        imgX1.isHidden = false
        imgY1.isHidden = false
        imgX2.isHidden = false
        imgY2.isHidden = false
        
        if counter != 4{
            butAyuda.isHidden = false
        }
        else{
            textViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
    }
    @IBAction func shuffleValores(_ sender: UIButton) {
        
        x1number = Int.random(in: -99 ... 100)
        y1number = Int.random(in: -99 ... 100)
        anumber = Int.random(in: -99 ... 100)
        while anumber % 4 != 0 {
            anumber = Int.random(in: -99 ... 100)
        }
        lbNumH?.text = String(x1number)
        lbNumK?.text = String(y1number)
        lbNumA?.text = String(anumber)
        txtViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgX1.isHidden = true
        imgX2.isHidden = true
        imgY1.isHidden = true
        imgY2.isHidden = true
        
        
        tfX1.backgroundColor = UIColor.white
        tfX2.backgroundColor = UIColor.white
        tfY1.backgroundColor = UIColor.white
        tfY2.backgroundColor = UIColor.white
        
        tfX1.text = ""
        tfX2.text = ""
        tfY1.text = ""
        tfY2.text = ""
        
    }
    
}
