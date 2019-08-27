//
//  CirculoD1Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/6/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CirculoD1Controller: UIView {
    
    @IBOutlet weak var imgR: UIImageView!
    @IBOutlet weak var imgK: UIImageView!
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var lbNumR: UILabel?
    @IBOutlet weak var lbNumX: UILabel?
    @IBOutlet weak var lbNumY: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfR: UITextField!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var textViewAyuda: UITextView!
    var xnumber : Int!
    var ynumber: Int!
    var rnumber: Double!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let squares = [4.0, 9.0, 16.0, 25.0, 36.0, 49.0, 64.0, 81.0, 100.0, 121.0, 144.0, 169.0, 196.0, 225.0, 256.0, 289.0, 324.0, 361.0, 400.0]
        xnumber = Int.random(in: -99 ... 100)
        ynumber = Int.random(in: -99 ... 100)
        rnumber = squares.randomElement()!
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("CirculoD1", owner: self, options: nil)
        lbNumX?.text = String(xnumber)
        lbNumY?.text = String(ynumber)
        lbNumR?.text = String(Int(rnumber))
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
        if tfK.text == String(-1*ynumber){
            counter += 1
            tfK.backgroundColor = UIColor.green
            imgK.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfK.backgroundColor = UIColor.red
            imgK.image = UIImage(named: "crossIcon")
        }
        if tfR.text == String(Int(sqrt(rnumber))){
            counter += 1
            tfR.backgroundColor = UIColor.green
            imgR.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfR.backgroundColor = UIColor.red
            imgR.image = UIImage(named: "crossIcon")
        }
        imgH.isHidden = false
        imgK.isHidden = false
        imgR.isHidden = false
        
        if counter != 3{
            butAyuda.isHidden = false
        }
        else{
            textViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
    }
    @IBAction func shuffleValores(_ sender: UIButton) {
        let squares = [4.0, 9.0, 16.0, 25.0, 36.0, 49.0, 64.0, 81.0, 100.0, 121.0, 144.0, 169.0, 196.0, 225.0, 256.0, 289.0, 324.0, 361.0, 400.0]
        xnumber = Int.random(in: -99 ... 100)
        ynumber = Int.random(in: -99 ... 100)
        rnumber = squares.randomElement()!
        lbNumX?.text = String(xnumber)
        lbNumY?.text = String(ynumber)
        lbNumR?.text = String(Int(rnumber))
        textViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgH.isHidden = true
        imgK.isHidden = true
        imgR.isHidden = true
        tfR.backgroundColor = UIColor.white
        tfK.backgroundColor = UIColor.white
        tfH.backgroundColor = UIColor.white
        tfR.text = ""
        tfH.text = ""
        tfK.text = ""
        
        
    }
    
}
