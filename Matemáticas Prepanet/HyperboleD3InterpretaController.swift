//
//  HyperboleD3InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/11/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class HyperboleD3InterpretaController: UIView {

   
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbIntersec1: UILabel?
    @IBOutlet weak var lbIntersec2: UILabel?
    @IBOutlet weak var lbFoco1X: UILabel?
    @IBOutlet weak var lbFoco1Y: UILabel?
    @IBOutlet weak var lbFoco2X: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var lbFoco2Y: UILabel?
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgK: UIImageView!
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgB: UIImageView!
    @IBOutlet weak var botAyuda: UIButton!
    @IBOutlet weak var txtViewAyuda: UITextView!
    
    var x1 : Int!
    var x2: Int!
    var foco1x : Int!
    var foco1y = 0
    var foco2x : Int!
    var foco2y = 0
    var centroX: Int!
    var centroY: Int!
    var valorCentro : Int!
    var aSquared : Double!
    var bSquared : Double!
    var cSquared : Double!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let pares = [4, 6, 8, 10, 12, 14, 16, 18, 20]
        let paresNegativos = [-4, -6, -8, -10, -12, -14, -16, -18, -20]
        foco1x = paresNegativos.randomElement()
        foco2x = pares.randomElement()
        x1 = foco1x + 1
        x2 = foco2x - 1
        valorCentro = ((-1*foco1x)+foco2x)/2
        centroX = foco1x + valorCentro
        centroY = 0
        setValores()
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("HiperbolaD3Interpreta", owner: self, options: nil)
        
        lbIntersec1?.text = String(x1)
        lbIntersec2?.text = String(x2)
        lbFoco1X?.text = String(foco1x)
        lbFoco1Y?.text = String(foco1y)
        lbFoco2X?.text = String(foco2x)
        lbFoco2Y?.text = String(foco2y)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
    }
    @IBAction func enviar(_ sender: Any) {
        var counter = 0
        if tfH.text == String(centroX){
            counter += 1
            tfH.backgroundColor = UIColor.green
            imgH.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfH.backgroundColor = UIColor.red
            imgH.image = UIImage(named: "crossIcon")
        }
        if tfA.text == String(Int(aSquared)){
            counter += 1
            tfA.backgroundColor = UIColor.green
            imgA.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfA.backgroundColor = UIColor.red
            imgA.image = UIImage(named: "crossIcon")
        }
        if tfK.text == String(centroY){
            counter += 1
            tfK.backgroundColor = UIColor.green
            imgK.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfK.backgroundColor = UIColor.red
            imgK.image = UIImage(named: "crossIcon")
        }
        if tfB.text == String(Int(bSquared)){
            counter += 1
            tfB.backgroundColor = UIColor.green
            imgB.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfB.backgroundColor = UIColor.red
            imgB.image = UIImage(named: "crossIcon")
        }
        
        
        imgA.isHidden = false
        imgK.isHidden = false
        imgH.isHidden = false
        imgB.isHidden = false
        
        if counter != 4{
            botAyuda.isHidden = false
        }
        else{
            txtViewAyuda.isHidden = true
            botAyuda.isHidden = true
        }
    }
    @IBAction func shuffleValores(_ sender: UIButton) {
        let pares = [4, 6, 8, 10, 12, 14, 16, 18, 20]
        let paresNegativos = [-4, -6, -8, -10, -12, -14, -16, -18, -20]
        foco1x = paresNegativos.randomElement()
        foco2x = pares.randomElement()
        x1 = foco1x + 1
        x2 = foco2x - 1
        valorCentro = ((-1*foco1x)+foco2x)/2
        centroX = foco1x + valorCentro
        centroY = foco1y + valorCentro
        setValores()
        lbIntersec1?.text = String(x1)
        lbIntersec2?.text = String(x2)
        lbFoco1X?.text = String(foco1x)
        lbFoco1Y?.text = String(foco1y)
        lbFoco2X?.text = String(foco2x)
        lbFoco2Y?.text = String(foco2y)
        txtViewAyuda.isHidden = true
        botAyuda.isHidden = true
        imgA.isHidden = true
        imgH.isHidden = true
        imgK.isHidden = true
        imgB.isHidden = true
        
        
        tfH.backgroundColor = UIColor.white
        tfK.backgroundColor = UIColor.white
        tfA.backgroundColor = UIColor.white
        tfB.backgroundColor = UIColor.white
        
        tfA.text = ""
        tfK.text = ""
        tfH.text = ""
        tfB.text = ""
        
    }
    func setValores(){
        cSquared = pow(Double(valorCentro),2)
        aSquared = pow(Double(valorCentro-1),2)
        bSquared = cSquared-aSquared
    }

}
