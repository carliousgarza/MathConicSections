//
//  HyperboleD1Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class HyperboleD1Controller: UIView {

    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbPrimerChar: UILabel?
    @IBOutlet weak var lbSegundoChar: UILabel?
    @IBOutlet weak var lbNumACuadrado: UILabel?
    @IBOutlet weak var lbNumBCuadrado: UILabel?
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var tfNumH: UITextField!
    @IBOutlet weak var tfNumK: UITextField!
    @IBOutlet weak var tfNumX1: UITextField!
    @IBOutlet weak var tfNumY1: UITextField!
    @IBOutlet weak var tfNumX2: UITextField!
    @IBOutlet weak var tfNumY2: UITextField!
    @IBOutlet weak var imgViewH: UIImageView!
    @IBOutlet weak var imgViewK: UIImageView!
    @IBOutlet weak var imgViewX1: UIImageView!
    @IBOutlet weak var imgViewY1: UIImageView!
    @IBOutlet weak var imgViewX2: UIImageView!
    @IBOutlet weak var imgViewY2: UIImageView!
    
    var primerChar : String!
    var segundoChar : String!
    var NumAcuadrado : Double!
    var NumBcuadrado : Double!
    var x1 : Int!
    var y1: Int!
    var x2: Int!
    var y2 : Int!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let squares = [4.0, 9.0, 16.0, 25.0, 36.0, 49.0, 64.0, 81.0, 100.0, 121.0, 144.0, 169.0, 196.0, 225.0, 256.0, 289.0, 324.0, 361.0, 400.0]
        let XoY = ["x", "y"]
        primerChar = XoY.randomElement()
        NumAcuadrado = squares.randomElement()
        NumBcuadrado = squares.randomElement()
        if primerChar == "x"{
            segundoChar = "y"
            setVertices(a: NumAcuadrado, esVertical: false)
        }
        else{
            segundoChar = "x"
            setVertices(a: NumAcuadrado, esVertical: true)
        }
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("HyperboleD1", owner: self, options: nil)
        lbPrimerChar?.text = String(primerChar)
        lbSegundoChar?.text = String(segundoChar)
        lbNumACuadrado?.text = String(Int(NumAcuadrado))
        lbNumBCuadrado?.text = String(Int(NumBcuadrado))
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        var counter = 0
        if tfNumH.text == "0"{
            counter += 1
            tfNumH.backgroundColor = UIColor.green
            imgViewH.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumH.backgroundColor = UIColor.red
            imgViewH.image = UIImage(named: "crossIcon")
        }
        if tfNumK.text == "0"{
            counter += 1
            tfNumK.backgroundColor = UIColor.green
            imgViewK.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumK.backgroundColor = UIColor.red
            imgViewK.image = UIImage(named: "crossIcon")
        }
        if tfNumX1.text == String(x1){
            counter += 1
            tfNumX1.backgroundColor = UIColor.green
            imgViewX1.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        else{
            tfNumX1.backgroundColor = UIColor.red
            imgViewX1.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
        }
        if tfNumX2.text == String(x1){
            counter += 1
            tfNumX2.backgroundColor = UIColor.green
            imgViewX2.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        else{
            tfNumX2.backgroundColor = UIColor.red
            imgViewX2.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
        }
        if tfNumY1.text == String(y1){
            counter += 1
            tfNumY1.backgroundColor = UIColor.green
            imgViewY1.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        else{
            tfNumY1.backgroundColor = UIColor.red
            imgViewY1.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
        }
        if tfNumY2.text == String(y2){
            counter += 1
            tfNumY2.backgroundColor = UIColor.green
            imgViewY2.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        else{
            tfNumY2.backgroundColor = UIColor.red
            imgViewY2.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
        }
        imgViewX1.isHidden = false
        imgViewH.isHidden = false
        imgViewK.isHidden = false
        imgViewX2.isHidden = false
        imgViewY1.isHidden = false
        imgViewY2.isHidden = false
        
        if counter != 6{
            butAyuda.isHidden = false
        }
        else{
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
    }
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
    }
    @IBAction func reload(_ sender: UIButton) {
        let squares = [4.0, 9.0, 16.0, 25.0, 36.0, 49.0, 64.0, 81.0, 100.0, 121.0, 144.0, 169.0, 196.0, 225.0, 256.0, 289.0, 324.0, 361.0, 400.0]
        let XoY = ["x", "y"]
        primerChar = XoY.randomElement()
        NumAcuadrado = squares.randomElement()
        NumBcuadrado = squares.randomElement()
        if primerChar == "x"{
            segundoChar = "y"
            setVertices(a: NumAcuadrado, esVertical: false)
        }
        else{
            segundoChar = "x"
            setVertices(a: NumAcuadrado, esVertical: true)
        }
        lbPrimerChar?.text = String(primerChar)
        lbSegundoChar?.text = String(segundoChar)
        lbNumACuadrado?.text = String(Int(NumAcuadrado))
        lbNumBCuadrado?.text = String(Int(NumBcuadrado))
        txtViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgViewX1.isHidden = true
        imgViewH.isHidden = true
        imgViewK.isHidden = true
        imgViewX2.isHidden = true
        imgViewY1.isHidden = true
        imgViewY2.isHidden = true
        tfNumH.backgroundColor = UIColor.white
        tfNumK.backgroundColor = UIColor.white
        tfNumX1.backgroundColor = UIColor.white
        tfNumX2.backgroundColor = UIColor.white
        tfNumY1.backgroundColor = UIColor.white
        tfNumY2.backgroundColor = UIColor.white
        tfNumH.text = ""
        tfNumK.text = ""
        tfNumX1.text = ""
        tfNumX2.text = ""
        tfNumY1.text = ""
        tfNumY2.text = ""
        
    }
    func setVertices(a: Double, esVertical: Bool){
        if (esVertical){
            x1 = 0
            x2 = 0
            y1 = Int(sqrt(a))
            y2 = -1*y1
        }
        else{
            y1 = 0
            y2 = 0
            x1 = Int(sqrt(a))
            x2 = -1*y1
        }
        
    }

}
