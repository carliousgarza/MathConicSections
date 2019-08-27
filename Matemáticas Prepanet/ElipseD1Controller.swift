//
//  ElipseD1Controller.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/8/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ElipseD1Controller: UIView {

    @IBOutlet weak var lbNumK: UILabel?
    @IBOutlet weak var lbNumH: UILabel?
    @IBOutlet weak var lbNumA: UILabel?
    @IBOutlet weak var lbNumB: UILabel?
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var imgViewR2: UIImageView!
    @IBOutlet weak var butHorizontal: UIButton!
    @IBOutlet weak var butVertical: UIButton!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet weak var txtViewAyuda: UITextView!
    
    var NumA : Int!
    var NumB : Int!
    var NumH : Int!
    var NumK : Int!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NumA = Int.random(in: 1 ... 100)
        NumB = Int.random(in: 1 ... 100)
        NumK = Int.random(in: -99 ... 100)
        NumH = Int.random(in: -99 ... 100)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit(){
        
        Bundle.main.loadNibNamed("ElipseD1", owner: self, options: nil)
        
        lbNumK?.text = String(NumK)
        lbNumH?.text = String(NumH)
        lbNumA?.text = String(NumA)
        lbNumB?.text = String(NumB)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func ayuda(_ sender: UIButton) {
         txtViewAyuda.isHidden = false
    }
    
    @IBAction func shuffleValores(_ sender: UIButton) {
        NumA = Int.random(in: 1 ... 100)
        NumB = Int.random(in: 1 ... 100)
        NumK = Int.random(in: -99 ... 100)
        NumH = Int.random(in: -99 ... 100)
        lbNumK?.text = String(NumK)
        lbNumH?.text = String(NumH)
        lbNumA?.text = String(NumA)
        lbNumB?.text = String(NumB)
        txtViewAyuda.isHidden = true
        butAyuda.isHidden = true
        imgViewR.isHidden = true
        imgViewR2.isHidden = true
        butHorizontal.backgroundColor = UIColor.clear
        butVertical.backgroundColor = UIColor.clear
        butHorizontal.isEnabled = true
        butVertical.isEnabled = true
    }
    @IBAction func horizontal(_ sender: UIButton) {
        if NumA*NumA > NumB*NumB {
            // es horizontal
            butHorizontal.backgroundColor = UIColor.green
            imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
            imgViewR.isHidden = false
            butVertical.isEnabled = false
        }
        else {
            // es vertical
            butHorizontal.backgroundColor = UIColor.red
            imgViewR.image = #imageLiteral(resourceName: "crossIcon")
            imgViewR.isHidden = false
            butVertical.isEnabled = false
            butAyuda.isHidden = false
        }
    }
    
    @IBAction func vertical(_ sender: UIButton) {
        if NumA*NumA > NumB*NumB {
            // es horizontal
            butVertical.backgroundColor = UIColor.red
            imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
            imgViewR2.isHidden = false
            butHorizontal.isEnabled = false
            butAyuda.isHidden = false
        }
        else {
            // es vertical
            butVertical.backgroundColor = UIColor.green
            imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
            imgViewR2.isHidden = false
            butHorizontal.isEnabled = false

        }
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
