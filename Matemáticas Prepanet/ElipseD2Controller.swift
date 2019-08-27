//
//  ElipseD2Controller.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/8/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ElipseD2Controller: UIView {

    @IBOutlet weak var lbNumH: UILabel?
    @IBOutlet weak var lbNumK: UILabel?
    @IBOutlet weak var lbNumA: UILabel?
    @IBOutlet weak var lbNumB: UILabel?
    @IBOutlet weak var tfVertice1: UITextField!
    @IBOutlet weak var tfVertice1y: UITextField!
    @IBOutlet weak var tfVertice2: UITextField!
    @IBOutlet weak var tfVertice2y: UITextField!
    @IBOutlet weak var tfCovertice1: UITextField!
    @IBOutlet weak var tfCovertice1y: UITextField!
    @IBOutlet weak var tfCovertice2: UITextField!
    @IBOutlet weak var tfCovertice2y: UITextField!
    @IBOutlet weak var textViewAyuda: UITextView!
    @IBOutlet weak var imgViewR: UIImageView!
    @IBOutlet weak var imgViewR2: UIImageView!
    @IBOutlet weak var imgViewR3: UIImageView!
    @IBOutlet weak var imgViewR4: UIImageView!
    @IBOutlet weak var butAyuda: UIButton!
    @IBOutlet var contentView: UIView!
    
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
        
        Bundle.main.loadNibNamed("ElipseD2", owner: self, options: nil)
        
        lbNumK?.text = String(NumK)
        lbNumH?.text = String(NumH)
        lbNumA?.text = String(NumA)
        lbNumB?.text = String(NumB)
        
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    @IBAction func ayuda(_ sender: UIButton) {
        textViewAyuda.isHidden = false
    }
    @IBAction func enviar(_ sender: Any) {
        
        var counter = 0
        
        if NumA*NumA > NumB*NumB {
            // es horizontal
            // las vertices son:    (h-a,k)  y  (h+a,k)
            // las co-vertices son: (h,k+b)  y  (h,k-b)
            
            let v1x = NumH-NumA
            let v1y = NumK!
            let v2x = NumH+NumA
            let v2y = NumK!
            let cv1x = NumH!
            let cv1y = NumK+NumB
            let cv2x = NumH!
            let cv2y = NumK-NumB
            
            if tfVertice1.text == String(v1x) && tfVertice1y.text == String(v1y){
                tfVertice1.backgroundColor = UIColor.green
                tfVertice1y.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
                counter+=1
            }
            else if tfVertice1.text == String(v1x) && tfVertice1y.text != String(v1y){
                tfVertice1.backgroundColor = UIColor.green
                tfVertice1y.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else if tfVertice1.text != String(v1x) && tfVertice1y.text == String(v1y){
                tfVertice1.backgroundColor = UIColor.red
                tfVertice1y.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else {
                tfVertice1.backgroundColor = UIColor.red
                tfVertice1y.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfVertice2.text == String(v2x) && tfVertice2y.text == String(v2y) {
                tfVertice2.backgroundColor = UIColor.green
                tfVertice2y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
                counter+=1
            }
            else if tfVertice2.text == String(v2x) && tfVertice2y.text != String(v2y){
                tfVertice2.backgroundColor = UIColor.green
                tfVertice2y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else if tfVertice2.text != String(v2x) && tfVertice2y.text == String(v2y){
                tfVertice2.backgroundColor = UIColor.red
                tfVertice2y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfVertice2.backgroundColor = UIColor.red
                tfVertice2y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfCovertice1.text == String(cv1x) && tfCovertice1y.text == String(cv1y){
                tfCovertice1.backgroundColor = UIColor.green
                tfCovertice1y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
                counter+=1
            }
            else if tfCovertice1.text == String(cv1x) && tfCovertice1y.text != String(cv1y){
                tfCovertice1.backgroundColor = UIColor.green
                tfCovertice1y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else if tfCovertice1.text != String(cv1x) && tfCovertice1y.text == String(cv1y){
                tfCovertice1.backgroundColor = UIColor.red
                tfCovertice1y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfCovertice1.backgroundColor = UIColor.red
                tfCovertice1y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
            if tfCovertice2.text == String(cv2x) && tfCovertice2y.text == String(cv2y) {
                tfCovertice2.backgroundColor = UIColor.green
                tfCovertice2y.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR4.isHidden = false
                counter+=1
            }
            else if tfCovertice2.text == String(cv2x) && tfCovertice2y.text != String(cv2y){
                tfCovertice2.backgroundColor = UIColor.green
                tfCovertice2y.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
            else if tfCovertice2.text != String(cv2x) && tfCovertice2y.text == String(cv2y){
                tfCovertice2.backgroundColor = UIColor.red
                tfCovertice2y.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
            else {
                tfCovertice2.backgroundColor = UIColor.red
                tfCovertice2y.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
        }
        else {
            // es vertical
            // las vertices son:    (h,a)  y  (h,-a)
            // las co-vertices son: (b,k)  y  (-b,k)
            
            let v1x = NumH!
            let v1y = NumK+NumB
            let v2x = NumH!
            let v2y = NumK-NumB
            let cv1x = NumH-NumA
            let cv1y = NumK!
            let cv2x = NumH+NumA
            let cv2y = NumK!
            
            if tfVertice1.text == String(v1x) && tfVertice1y.text == String(v1y){
                tfVertice1.backgroundColor = UIColor.green
                tfVertice1y.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR.isHidden = false
                counter+=1
            }
            else if tfVertice1.text == String(v1x) && tfVertice1y.text != String(v1y){
                tfVertice1.backgroundColor = UIColor.green
                tfVertice1y.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else if tfVertice1.text != String(v1x) && tfVertice1y.text == String(v1y){
                tfVertice1.backgroundColor = UIColor.red
                tfVertice1y.backgroundColor = UIColor.green
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            else {
                tfVertice1.backgroundColor = UIColor.red
                tfVertice1y.backgroundColor = UIColor.red
                imgViewR.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR.isHidden = false
            }
            
            if tfVertice2.text == String(v2x) && tfVertice2y.text == String(v2y) {
                tfVertice2.backgroundColor = UIColor.green
                tfVertice2y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR2.isHidden = false
                counter+=1
            }
            else if tfVertice2.text == String(v2x) && tfVertice2y.text != String(v2y){
                tfVertice2.backgroundColor = UIColor.green
                tfVertice2y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else if tfVertice2.text != String(v2x) && tfVertice2y.text == String(v2y){
                tfVertice2.backgroundColor = UIColor.red
                tfVertice2y.backgroundColor = UIColor.green
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            else {
                tfVertice2.backgroundColor = UIColor.red
                tfVertice2y.backgroundColor = UIColor.red
                imgViewR2.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR2.isHidden = false
            }
            
            if tfCovertice1.text == String(cv1x) && tfCovertice1y.text == String(cv1y){
                tfCovertice1.backgroundColor = UIColor.green
                tfCovertice1y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR3.isHidden = false
                counter+=1
            }
            else if tfCovertice1.text == String(cv1x) && tfCovertice1y.text != String(cv1y){
                tfCovertice1.backgroundColor = UIColor.green
                tfCovertice1y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else if tfCovertice1.text != String(cv1x) && tfCovertice1y.text == String(cv1y){
                tfCovertice1.backgroundColor = UIColor.red
                tfCovertice1y.backgroundColor = UIColor.green
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            else {
                tfCovertice1.backgroundColor = UIColor.red
                tfCovertice1y.backgroundColor = UIColor.red
                imgViewR3.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR3.isHidden = false
            }
            
            if tfCovertice2.text == String(cv2x) && tfCovertice2y.text == String(cv2y) {
                tfCovertice2.backgroundColor = UIColor.green
                tfCovertice2y.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "checkmarkIcon")
                imgViewR4.isHidden = false
                counter+=1
            }
            else if tfCovertice2.text == String(cv2x) && tfCovertice2y.text != String(cv2y){
                tfCovertice2.backgroundColor = UIColor.green
                tfCovertice2y.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
            else if tfCovertice2.text != String(cv2x) && tfCovertice2y.text == String(cv2y){
                tfCovertice2.backgroundColor = UIColor.red
                tfCovertice2y.backgroundColor = UIColor.green
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
            else {
                tfCovertice2.backgroundColor = UIColor.red
                tfCovertice2y.backgroundColor = UIColor.red
                imgViewR4.image = #imageLiteral(resourceName: "crossIcon")
                imgViewR4.isHidden = false
            }
        }
        if counter != 4 {
            butAyuda.isHidden = false
        } else {
            textViewAyuda.isHidden = true
            butAyuda.isHidden = true
        }
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
        
        textViewAyuda.isHidden = true
        butAyuda.isHidden = true
        
        imgViewR.isHidden = true
        imgViewR2.isHidden = true
        imgViewR3.isHidden = true
        imgViewR4.isHidden = true
        
        tfVertice1.backgroundColor = UIColor.white
        tfVertice2.backgroundColor = UIColor.white
        tfCovertice1.backgroundColor = UIColor.white
        tfCovertice2.backgroundColor = UIColor.white
        tfVertice1y.backgroundColor = UIColor.white
        tfVertice2y.backgroundColor = UIColor.white
        tfCovertice1y.backgroundColor = UIColor.white
        tfCovertice2y.backgroundColor = UIColor.white
        
        tfVertice1.text = ""
        tfVertice2.text = ""
        tfCovertice1.text = ""
        tfCovertice2.text = ""
        tfVertice1y.text = ""
        tfVertice2y.text = ""
        tfCovertice1y.text = ""
        tfCovertice2y.text = ""
        
    }

}
