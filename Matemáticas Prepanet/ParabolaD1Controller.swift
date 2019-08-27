//
//  CirculoD1Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/6/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ParabolaD1Controller: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgK: UIImageView!
    @IBOutlet weak var lbNumA: UILabel?
    @IBOutlet weak var lbNumH: UILabel?
    @IBOutlet weak var lbNumK: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var butAyuda: UIButton!
    
    @IBOutlet weak var textViewAyuda: UITextView!
    

//    @IBOutlet weak var lbNumR: UILabel?
//    @IBOutlet weak var lbNumX: UILabel?
//    @IBOutlet weak var lbNumY: UILabel?
//    @IBOutlet weak var tfH: UITextField!
//    @IBOutlet weak var tfK: UITextField!
//    @IBOutlet weak var tfR: UITextField!
//    @IBOutlet var contentView: UIView!
//    @IBOutlet weak var butAyuda: UIButton!
//    @IBOutlet weak var textViewAyuda: UITextView!
    
    
    var xnumber : Int!
    var ynumber: Int!
    var anumber: Int!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xnumber = Int.random(in: -99 ... 100)
        ynumber = Int.random(in: -99 ... 100)
        anumber = Int.random(in: -99 ... 100)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("ParabolaD1", owner: self, options: nil)
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
        var counter = 0
        if tfH.text == String(xnumber){
            counter += 1
            tfH.backgroundColor = UIColor.green
            imgH.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfH.backgroundColor = UIColor.red
            imgH.image = UIImage(named: "crossIcon")
        }
        if tfK.text == String(ynumber){
            counter += 1
            tfK.backgroundColor = UIColor.green
            imgK.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfK.backgroundColor = UIColor.red
            imgK.image = UIImage(named: "crossIcon")
        }
      
        imgH.isHidden = false
        imgK.isHidden = false
        
        if counter != 2{
            butAyuda.isHidden = false
        }
        else{
            textViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
    }
    @IBAction func shuffleValores(_ sender: UIButton) {
      
        xnumber = Int.random(in: -99 ... 100)
        ynumber = Int.random(in: -99 ... 100)
        anumber = Int.random(in: -99 ... 100)
        lbNumH?.text = String(xnumber)
        lbNumK?.text = String(ynumber)
        lbNumA?.text = String(anumber)
        textViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgH.isHidden = true
        imgK.isHidden = true

        tfK.backgroundColor = UIColor.white
        tfH.backgroundColor = UIColor.white
        tfH.text = ""
        tfK.text = ""
        
        
    }
    
}
