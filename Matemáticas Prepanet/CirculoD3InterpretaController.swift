//
//  CirculoD3InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/9/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CirculoD3InterpretaController: UIView {

    @IBOutlet weak var lbNumX: UILabel?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumY: UILabel?
    @IBOutlet weak var lbNumRestante: UILabel?
    @IBOutlet weak var tfNumH: UITextField!
    @IBOutlet weak var tfNumK: UITextField!
    @IBOutlet weak var tfNumR: UITextField!
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var butMostrarResultado: UIButton!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var imgViewH: UIImageView!
    @IBOutlet weak var imgViewK: UIImageView!
    @IBOutlet weak var imgViewR: UIImageView!
    
    var NumX : Double!
    var NumY : Double!
    var NumRestante : Int!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let squares = [4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 18.0, 20.0, 22.0, 24.0, 26.0, 28.0, 30.0, 32.0, 34.0, 36.0, 38.0, 40.0, 42.0, 44.0, 46.0, 48.0, 50.0]
        NumX = squares.randomElement()
        NumY = squares.randomElement()
        NumRestante = Int.random(in: 1 ... 30)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("CirculoD3Interpreta", owner: self, options: nil)
        lbNumX?.text = String(Int((NumX)))
        lbNumY?.text = String(Int((NumY)))
        lbNumRestante?.text = String(NumRestante)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        var counter = 0
        if tfNumH.text == String(Int(NumX / -2)){
            counter += 1
            tfNumH.backgroundColor = UIColor.green
            imgViewH.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumH.backgroundColor = UIColor.red
            imgViewH.image = UIImage(named: "crossIcon")
        }
        if tfNumK.text == String(Int(NumY / 2)){
            counter += 1
            tfNumK.backgroundColor = UIColor.green
            imgViewK.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumK.backgroundColor = UIColor.red
            imgViewK.image = UIImage(named: "crossIcon")
        }
        if tfNumR.text == String(NumeroRestante(x: NumX, y: NumY, NumR: Double(NumRestante))){
            counter += 1
            tfNumR.backgroundColor = UIColor.green
            imgViewR.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        else{
            tfNumR.backgroundColor = UIColor.red
            imgViewR.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
        }
        imgViewR.isHidden = false
        imgViewH.isHidden = false
        imgViewK.isHidden = false
        
        if counter != 3{
            butAyuda.isHidden = false
        }
        else{
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
            butMostrarResultado.isHidden = true
        }
    }
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
        butMostrarResultado.isHidden = false
    }
    @IBAction func reload(_ sender: UIButton) {
        let squares = [4.0, 6.0, 8.0, 10.0, 12.0, 14.0, 16.0, 18.0, 20.0, 22.0, 24.0, 26.0, 28.0, 30.0, 32.0, 34.0, 36.0, 38.0, 40.0, 42.0, 44.0, 46.0, 48.0, 50.0]
        NumX = squares.randomElement()
        NumY = squares.randomElement()
        NumRestante = Int.random(in: 1 ... 30)
        lbNumX?.text = String(Int((NumX)))
        lbNumY?.text = String(Int((NumY)))
        lbNumRestante?.text = String(NumRestante)
        txtViewAyuda.isHidden = true
        butAyuda.isHidden = true
        butMostrarResultado.isHidden = true
        imgViewR.isHidden = true
        imgViewH.isHidden = true
        imgViewK.isHidden = true
        tfNumH.backgroundColor = UIColor.white
        tfNumK.backgroundColor = UIColor.white
        tfNumR.backgroundColor = UIColor.white
        tfNumH.text = ""
        tfNumK.text = ""
        tfNumR.text = ""
    }
    func NumeroRestante(x: Double, y: Double, NumR: Double)->Int{
        let xTemp = pow(x/2,2)
        let yTemp = pow(y/2,2)
        let NewNumR = (-1*NumR)+xTemp+yTemp
        return Int(NewNumR)
    }
    @IBAction func mostrarResultado(_ sender: UIButton) {
        tfNumH.text = String(Int(NumX / -2))
        tfNumK.text = String(Int(NumY / 2))
        tfNumR.text = String(NumeroRestante(x: NumX, y: NumY, NumR: Double(NumRestante)))
        tfNumH.backgroundColor = UIColor.yellow
        tfNumK.backgroundColor = UIColor.yellow
        tfNumR.backgroundColor = UIColor.yellow
        imgViewR.isHidden = true
        imgViewH.isHidden = true
        imgViewK.isHidden = true
    }
    
    
    

}
