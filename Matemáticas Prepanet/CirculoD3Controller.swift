//
//  CirculoD3Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/8/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CirculoD3Controller: UIView {
    var CentroX : Int!
    var CentroY : Int!
    var EcuacionX : Int!
    var EcuacionY : Int!
    var EcuacionRestante : Int!
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbCentroX: UILabel?
    @IBOutlet weak var lbCentroY: UILabel?
    @IBOutlet weak var lbEcuacionX: UILabel?
    @IBOutlet weak var lbEcuacionY: UILabel?
    @IBOutlet weak var lbEcuacionRestante: UILabel?
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var tfRespuesta: UITextField!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var butMostrarResp: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CentroX = Int.random(in: -99 ... 100)
        CentroY = Int.random(in: -99 ... 100)
        EcuacionX = Int.random(in: -99 ... 100)
        EcuacionY = Int.random(in: -99 ... 100)
        EcuacionRestante = Int.random(in: -99 ... 100)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        Bundle.main.loadNibNamed("CirculoD3", owner: self, options: nil)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbEcuacionX?.text = String(EcuacionX)
        lbEcuacionY?.text = String(EcuacionY)
        lbEcuacionRestante?.text = String(EcuacionRestante)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        if tfRespuesta.text == String((radioDelCirculo(x: Double(CentroX), y: Double(CentroY), eX: Double(EcuacionX), eY: Double(EcuacionY), eRestante:  Double(EcuacionRestante)))){
            tfRespuesta.backgroundColor = UIColor.green
            imgViewR.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
            butMostrarResp.isHidden = true
        }
        else{
            tfRespuesta.backgroundColor = UIColor.red
            imgViewR.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
            butMostrarResp.isHidden = false
        }
        imgViewR.isHidden = false
    }
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
    }
    @IBAction func reload(_ sender: UIButton) {
        CentroX = Int.random(in: -99 ... 100)
        CentroY = Int.random(in: -99 ... 100)
        EcuacionX = Int.random(in: -99 ... 100)
        EcuacionY = Int.random(in: -99 ... 100)
        EcuacionRestante = Int.random(in: -99 ... 100)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbEcuacionX?.text = String(EcuacionX)
        lbEcuacionY?.text = String(EcuacionY)
        lbEcuacionRestante?.text = String(EcuacionRestante)
        txtViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgViewR.isHidden = true
        tfRespuesta.backgroundColor = UIColor.white
        tfRespuesta.text = ""
        butMostrarResp.setTitle("Mostrar Respuesta", for: UIControl.State.normal)
        butMostrarResp.isHidden = true
    }
    func radioDelCirculo(x: Double, y: Double, eX: Double, eY: Double, eRestante: Double) -> Int{
        let slope = (-1*eX)/eY
        let slopeOfMyRadius = eY/eX
        let newERestante = eRestante/eY
        let newERestante2 = (slopeOfMyRadius*(-1*x))+y
        let otherValue = newERestante+(-1*(newERestante2))
        let xValue = slopeOfMyRadius+(-1*slope)
        let xFinal = otherValue/xValue
        let yFinal = (xFinal*slopeOfMyRadius)+newERestante2
        let rFinal = sqrt(pow((x-xFinal), 2) + pow((y-yFinal), 2))
        
        return Int(round(rFinal))
        
    }
    
    @IBAction func mostrarRespuesta(_ sender: UIButton) {
        butMostrarResp.setTitle(String((radioDelCirculo(x: Double(CentroX), y: Double(CentroY), eX: Double(EcuacionX), eY: Double(EcuacionY), eRestante:  Double(EcuacionRestante)))), for: UIControl.State.normal)
    }
    
}
