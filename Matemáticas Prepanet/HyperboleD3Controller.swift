//
//  HyperboleD3Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/10/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class HyperboleD3Controller: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumX: UILabel?
    @IBOutlet weak var lbNumY: UILabel?
    @IBOutlet weak var lbNumRestante: UILabel?
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var tfNumH: UITextField!
    @IBOutlet weak var tfNumK: UITextField!
    @IBOutlet weak var tfNumY1: UITextField!
    @IBOutlet weak var tfNumX1: UITextField!
    @IBOutlet weak var tfNumX2: UITextField!
    @IBOutlet weak var tfNumY2: UITextField!
    @IBOutlet weak var imgViewH: UIImageView!
    @IBOutlet weak var imgViewK: UIImageView!
    @IBOutlet weak var imgViewX1: UIImageView!
    @IBOutlet weak var imgViewY1: UIImageView!
    @IBOutlet weak var imgViewX2: UIImageView!
    @IBOutlet weak var imgViewY2: UIImageView!
    @IBOutlet weak var butMostrarRespuesta: UIButton!
    
    
    var numRestante : Double!
    var NumX : Double!
    var NumY : Double!
    var centerX : Int!
    var centerY: Int!
    var x1 : Int!
    var y1: Int!
    var x2: Int!
    var y2 : Int!
    var perfectSquareX : Double!
    var perfectSquareY : Double!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let pares = [4.0, 6.0, 8.0, 10.0, 12.0]
        NumX = pares.randomElement()
        NumY = pares.randomElement()
        numRestante = Double.random(in: 40.0 ... 100.0)
        centerX = Int(-1*(NumX/2))
        centerY = Int(-1*(NumY/2))
        setVertices()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("HyperboleD3", owner: self, options: nil)
        lbNumRestante?.text = String(Int(numRestante))
        lbNumX?.text = String(Int(NumX))
        lbNumY?.text = String(Int(NumY))
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
            butMostrarRespuesta.isHidden = true
        }
    }
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
        butMostrarRespuesta.isHidden = false
    }
    @IBAction func reload(_ sender: UIButton) {
        
        let pares = [4.0, 6.0, 8.0, 10.0, 12.0]
        NumX = pares.randomElement()
        NumY = pares.randomElement()
        numRestante = Double.random(in: 40.0 ... 100.0)
        centerX = Int(-1*(NumX/2))
        centerY = Int(-1*(NumY/2))
        setVertices()
        lbNumRestante?.text = String(Int(numRestante))
        lbNumX?.text = String(Int(NumX))
        lbNumY?.text = String(Int(NumY))
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
        butMostrarRespuesta.isHidden = true
        
    }
    func setVertices(){
        perfectSquareX = pow((NumX/2),2)
        perfectSquareY = pow((NumY/2),2)
        x1 = centerX + Int(round(sqrt(numRestante+perfectSquareX-perfectSquareY)))
        x2 = centerX - Int(round(sqrt(numRestante+perfectSquareX-perfectSquareY)))
        y1 = centerY
        y2 = centerY
    }
    
    @IBAction func mostrarResp(_ sender: UIButton) {
        tfNumH.backgroundColor = UIColor.yellow
        tfNumK.backgroundColor = UIColor.yellow
        tfNumX1.backgroundColor = UIColor.yellow
        tfNumX2.backgroundColor = UIColor.yellow
        tfNumY1.backgroundColor = UIColor.yellow
        tfNumY2.backgroundColor = UIColor.yellow
        tfNumH.text = String(centerX)
        tfNumK.text = String(centerY)
        tfNumX1.text = String(x1)
        tfNumX2.text = String(x2)
        tfNumY1.text = String(y1)
        tfNumY2.text = String(y2)
        imgViewX1.isHidden = true
        imgViewH.isHidden = true
        imgViewK.isHidden = true
        imgViewX2.isHidden = true
        imgViewY1.isHidden = true
        imgViewY2.isHidden = true
    }
    
    
    
    

}
