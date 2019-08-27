//
//  CirculoD2Interpreta.swift
//  Matemáticas Prepanet
//
//  Created by Jorge Amione on 11/8/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CirculoD2Interpreta: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbCentroX: UILabel?
    @IBOutlet weak var lbCentroY: UILabel?
    @IBOutlet weak var lbRadio: UILabel?
    @IBOutlet weak var tfNumH: UITextField!
    @IBOutlet weak var tfNumK: UITextField!
    @IBOutlet weak var tfNumR: UITextField!
    @IBOutlet weak var imgViewH: UIImageView!
    @IBOutlet weak var imgViewK: UIImageView!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var butAyuda: UIButton!
    
    var CentroX : Int!
    var CentroY : Int!
    var Radio : Int!
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CentroX = Int.random(in: -99 ... 100)
        CentroY = Int.random(in: -99 ... 100)
        Radio = Int.random(in: 1 ... 100)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){

        Bundle.main.loadNibNamed("CirculoD2Interpreta", owner: self, options: nil)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbRadio?.text = String(Radio)
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
        if tfNumR.text == String(Int(pow(Double(Radio),2))){
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
        Radio = Int.random(in: 1 ... 100)
        lbCentroX?.text = String(CentroX)
        lbCentroY?.text = String(CentroY)
        lbRadio?.text = String(Radio)
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
    
}
