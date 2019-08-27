//
//  CirculoD2Controller.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/7/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CirculoD2Controller: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbCentroX: UILabel?
    @IBOutlet weak var lbCentroY: UILabel?
    @IBOutlet weak var lbExtremoX: UILabel?
    @IBOutlet weak var lbExtremoY: UILabel?
    @IBOutlet weak var tfRespuesta: UITextField!
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var butAyuda: UIButton!
    
    
    var CentroX : Int!
    var CentroY : Int!
    var ExtremoX : Int!
    var ExtremoY: Int!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CentroX = Int.random(in: -99 ... 100)
        CentroY = Int.random(in: -99 ... 100)
        ExtremoX = Int.random(in: -99 ... 100)
        ExtremoY = Int.random(in: -99 ... 100)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("CirculoD2", owner: self, options: nil)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbExtremoX?.text = String(ExtremoX)
        lbExtremoY?.text = String(ExtremoY)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func enviar(_ sender: UIButton) {
        if tfRespuesta.text == String((radioDelCirculo(x: Double(CentroX), y: Double(CentroY), eX: Double(ExtremoX), eY: Double(ExtremoY)))){
            tfRespuesta.backgroundColor = UIColor.green
            imgViewR.image = UIImage(named: "checkmarkIcon")
            txtViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
        else{
            tfRespuesta.backgroundColor = UIColor.red
            imgViewR.image = UIImage(named: "crossIcon")
            butAyuda.isHidden = false
        }
        imgViewR.isHidden = false
    }
    @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
    }
    @IBAction func reload(_ sender: UIButton) {
        CentroX = Int.random(in: -99 ... 100)
        CentroY = Int.random(in: -99 ... 100)
        ExtremoX = Int.random(in: -99 ... 100)
        ExtremoY = Int.random(in: -99 ... 100)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbExtremoX?.text = String(ExtremoX)
        lbExtremoY?.text = String(ExtremoY)
        txtViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgViewR.isHidden = true
        tfRespuesta.backgroundColor = UIColor.white
        tfRespuesta.text = ""
    }
    
    func radioDelCirculo(x: Double, y: Double, eX: Double, eY: Double) -> Int{
        let xTemp = eX - x
        let yTemp = eY - y
        let rTemp = sqrt(pow(xTemp, 2) + pow(yTemp, 2))
        return Int(round(rTemp))
        
    }
    
}
