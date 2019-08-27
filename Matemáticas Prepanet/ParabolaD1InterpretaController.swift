//
//  ParabolaD1InterpretaController.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 11/10/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class ParabolaD1InterpretaController: UIView {

    
    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbNumH: UILabel?
    @IBOutlet weak var lbNumk: UILabel?
    @IBOutlet weak var lbNumX: UILabel?
    @IBOutlet weak var lbNumY: UILabel?
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var botAyuda: UIButton!
    @IBOutlet weak var txtViewAyuda: UITextView!
    @IBOutlet weak var imgH: UIImageView!
    @IBOutlet weak var imgA: UIImageView!
    @IBOutlet weak var imgK: UIImageView!
    
 
    

     
     var x1number : Int!
     var y1number: Int!
     var x2number : Int!
     var y2number: Int!
     var anumber: Int!
     var p: Int!
     
     
     override init(frame: CGRect) {
         super.init(frame: frame)
         x1number = Int.random(in: -99 ... 100)
         y1number = Int.random(in: -99 ... 100)
         x2number = x1number
         y2number = Int.random(in: -99 ... 100)
         
         commonInit()
     }
     
     required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
     }
     func commonInit(){
     
     Bundle.main.loadNibNamed("ParabolaD1Interpreta", owner: self, options: nil)
         lbNumH?.text = String(x1number)
         lbNumk?.text = String(y1number)
         lbNumX?.text = String(x2number)
         lbNumY?.text = String(y2number)
         addSubview(contentView)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
     }
     @IBAction func ayuda(_ sender: UIButton) {
        txtViewAyuda.isHidden = false
     }
     @IBAction func enviar(_ sender: Any) {
        
        
        
        
  
        p = y2number - y1number
        anumber = p * 4
        print(anumber)
         var counter = 0
         //X1
         if tfH.text == String(x1number){
             counter += 1
             tfH.backgroundColor = UIColor.green
             imgH.image = UIImage(named: "checkmarkIcon")
         }
         else{
             tfH.backgroundColor = UIColor.red
             imgH.image = UIImage(named: "crossIcon")
         }
         //Y1
         if tfA.text == String(anumber){
             counter += 1
             tfA.backgroundColor = UIColor.green
             imgA.image = UIImage(named: "checkmarkIcon")
         }
         else{
             tfA.backgroundColor = UIColor.red
             imgA.image = UIImage(named: "crossIcon")
         }
         //X2
         if tfK.text == String(y1number){
             counter += 1
             tfK.backgroundColor = UIColor.green
             imgK.image = UIImage(named: "checkmarkIcon")
         }
         else{
             tfK.backgroundColor = UIColor.red
             imgK.image = UIImage(named: "crossIcon")
         }
        
        
         imgA.isHidden = false
         imgK.isHidden = false
         imgH.isHidden = false
        
         if counter != 3{
             botAyuda.isHidden = false
         }
         else{
             txtViewAyuda.isHidden = true
             botAyuda.isHidden = true
         }
        }
     @IBAction func shuffleValores(_ sender: UIButton) {
     
     x1number = Int.random(in: -99 ... 100)
     y1number = Int.random(in: -99 ... 100)
     x2number = x1number
     y2number = Int.random(in: -99 ... 100)
     lbNumH?.text = String(x1number)
     lbNumk?.text = String(y1number)
     lbNumX?.text = String(x2number)
     lbNumY?.text = String(y2number)
     txtViewAyuda.isHidden = true
     botAyuda.isHidden = true
     imgA.isHidden = true
     imgH.isHidden = true
     imgK.isHidden = true
     
     
     tfH.backgroundColor = UIColor.white
     tfK.backgroundColor = UIColor.white
     tfA.backgroundColor = UIColor.white
     
     tfA.text = ""
     tfK.text = ""
     tfH.text = ""
     
     }
 
 
 
 
   
    
    
    
    
    
    
    
    
    
    
    /*
     
     // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
