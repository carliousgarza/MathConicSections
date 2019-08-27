//
//  CirculoD1InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/8/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CirculoD1InterpretaController: UIView {
    
    @IBOutlet weak var lbCentroX: UILabel?
    @IBOutlet weak var lbCentroY: UILabel?
    @IBOutlet weak var lbExtremoX: UILabel?
    @IBOutlet weak var lbExtremoY: UILabel?
    @IBOutlet weak var tfNumH: UITextField!
    @IBOutlet weak var tfNumK: UITextField!
    @IBOutlet weak var tfNumR: UITextField!
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var imgViewH: UIImageView!
    @IBOutlet weak var imgViewK: UIImageView!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet var contentView: UIView!
    
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
        
        Bundle.main.loadNibNamed("CirculoD1Interpreta", owner: self, options: nil)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbExtremoX?.text = String(ExtremoX)
        lbExtremoY?.text = String(ExtremoY)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func enviar(_ sender: UIButton) {
        var counter = 0
        if tfNumH.text == String(CentroX){
            counter += 1
            tfNumH.backgroundColor = UIColor.green
            imgViewH.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumH.backgroundColor = UIColor.red
            imgViewH.image = UIImage(named: "crossIcon")
        }
        if tfNumK.text == String(CentroY){
            counter += 1
            tfNumK.backgroundColor = UIColor.green
            imgViewK.image = UIImage(named: "checkmarkIcon")
        }
        else{
            tfNumK.backgroundColor = UIColor.red
            imgViewK.image = UIImage(named: "crossIcon")
        }
        if tfNumR.text == String((radioDelCirculo(x: Double(CentroX), y: Double(CentroY), eX: Double(ExtremoX), eY: Double(ExtremoY)))){
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
        }
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
        imgViewH.isHidden = true
        imgViewK.isHidden = true
        tfNumH.backgroundColor = UIColor.white
        tfNumK.backgroundColor = UIColor.white
        tfNumR.backgroundColor = UIColor.white
        tfNumH.text = ""
        tfNumK.text = ""
        tfNumR.text = ""
    }
    func radioDelCirculo(x: Double, y: Double, eX: Double, eY: Double) -> Int{
        let xTemp = eX - x
        let yTemp = eY - y
        let rTemp = pow(xTemp, 2) + pow(yTemp, 2)
        return Int(round(rTemp))
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
