//
//  HyperboleD2Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class HyperboleD2Controller: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumRestante1: UILabel?
    @IBOutlet weak var lbNumAcuadrado: UILabel?
    @IBOutlet weak var lbNumBcuadrado: UILabel?
    @IBOutlet weak var lbNumRestante2: UILabel?
    @IBOutlet weak var lbPrimerChar: UILabel?
    @IBOutlet weak var lbSegundoChar: UILabel?
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
    var numRestante1 : Int!
    var numRestante2 : Int!
    var centerX : Int!
    var centerY: Int!
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
        numRestante1 = Int.random(in: 1 ... 9)
        numRestante2 = Int.random(in: 1 ... 9)
        if primerChar == "x"{
            segundoChar = "y"
            centerX = -1*numRestante1
            centerY = numRestante2
            setFocos(a: NumAcuadrado, b: NumBcuadrado, esVertical: false)
        }
        else{
            segundoChar = "x"
            centerX = numRestante2
            centerY = -1*numRestante1
            setFocos(a: NumAcuadrado, b:NumBcuadrado, esVertical: true)
        }
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("HyperboleD2", owner: self, options: nil)
        lbPrimerChar?.text = String(primerChar)
        lbSegundoChar?.text = String(segundoChar)
        lbNumRestante1?.text = String(numRestante1)
        lbNumRestante2?.text = String(numRestante2)
        lbNumAcuadrado?.text = String(Int(NumAcuadrado))
        lbNumBcuadrado?.text = String(Int(NumBcuadrado))
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        var counter = 0
        if tfNumH.text == String(centerX){
            counter += 1
            tfNumH.backgroundColor = UIColor.green
            imgViewH.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumH.backgroundColor = UIColor.red
            imgViewH.image = UIImage(named: "crossIcon")
        }
        if tfNumK.text == String(centerY){
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
        if tfNumX2.text == String(x2){
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
        numRestante1 = Int.random(in: 1 ... 9)
        numRestante2 = Int.random(in: 1 ... 9)
        if primerChar == "x"{
            segundoChar = "y"
            centerX = -1*numRestante1
            centerY = numRestante2
            setFocos(a: NumAcuadrado, b: NumBcuadrado, esVertical: false)
        }
        else{
            segundoChar = "x"
            centerX = numRestante2
            centerY = -1*numRestante1
            setFocos(a: NumAcuadrado, b: NumBcuadrado, esVertical: true)
        }
        lbPrimerChar?.text = String(primerChar)
        lbSegundoChar?.text = String(segundoChar)
        lbNumAcuadrado?.text = String(Int(NumAcuadrado))
        lbNumBcuadrado?.text = String(Int(NumBcuadrado))
        lbNumRestante1?.text = String(numRestante1)
        lbNumRestante2?.text = String(numRestante2)
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
    func setFocos(a: Double, b: Double, esVertical: Bool){
        if (esVertical){
            let c = round(sqrt(a+b))
            x1 = numRestante2
            x2 = numRestante2
            y1 = (-1*numRestante1) + Int(c)
            y2 = (-1*numRestante1) - Int(c)
        }
        else{
            let c = round(sqrt(a+b))
            y1 = numRestante2
            y2 = numRestante2
            x1 = (-1*numRestante1) + Int(c)
            x2 = (-1*numRestante1) - Int(c)
        }
        
    }

}
