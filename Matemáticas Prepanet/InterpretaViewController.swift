//
//  InterpretaViewController.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 10/31/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class InterpretaViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    var contadorDificultad = 1
    var pickerRow = 0
    var vista = CirculoD1InterpretaController()
    var vista2 = CirculoD2Interpreta()
    var vista3 = CirculoD3InterpretaController()
    var vistaP1 = ParabolaD1InterpretaController()
    var vistaP2 = ParabolaD2InterpretaController()
    var vistaP3 = ParabolaD3InterpretaController()
    var vistaE1 = ElipseD1InterpretaController()
    var vistaE2 = ElipseD2InterpretaController()
    var vistaE3 = ElipseD3InterpretaController()
    var vistaH1 = HiperbolaD1InterpretaController()
    var vistaH2 = HiperbolaD2InterpretaController()
    var vistaH3 = HyperboleD3InterpretaController()
    var ValorX : Double!
    var ValorY : Double!
    
    
    @IBOutlet weak var butDificultadMayor: UIButton!
    @IBOutlet weak var butDificultadMenor: UIButton!
    @IBOutlet weak var pickerV: UIPickerView!
    @IBOutlet weak var labFig: UILabel!
    let arrImagenes : [UIImage] = [UIImage(named: "Circuloo")!, UIImage(named: "Parabolaa")!, UIImage(named: "Hyperbola")!, UIImage(named: "Elipse")!]
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func regresa(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        if UIScreen.main.bounds.maxX < 330{
            ValorX = Double(UIScreen.main.bounds.maxX) * 0.04
            ValorY = Double(UIScreen.main.bounds.maxY)*0.32
        }
        else {
            ValorX = Double(UIScreen.main.bounds.maxX) * 0.1
            ValorY = Double(UIScreen.main.bounds.maxY)*0.4
        }
        vista = CirculoD1InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
        pickerV.delegate = self
        pickerV.dataSource = self
        view.addSubview(vista)
        assignbackground()
        
        
        // Do any additional setup after loading the view.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 4
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let myView = UIView(frame: CGRect(x:0, y:0, width:pickerView.bounds.width - 30, height:50))
        
        let myImageView = UIImageView(frame: CGRect(x:(UIScreen.main.bounds.width*0.47) - (UIScreen.main.bounds.height*0.2*0.5) ,y:-40,width:(UIScreen.main.bounds.height)*0.2,height:(UIScreen.main.bounds.height)*0.2))
        
        switch row {
        case 0:
            myImageView.image = arrImagenes[row]
        case 1:
            myImageView.image = arrImagenes[row]
        case 2:
            myImageView.image = arrImagenes[row]
        case 3:
            myImageView.image = arrImagenes[row]
        default:
            myImageView.image = nil
        }
        
        myView.addSubview(myImageView)
        
        return myView
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerRow = row
        removeSubviews()
        switch row {
        case 0:
            if contadorDificultad == 1{
                vista = CirculoD1InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vista)
            }
            else if contadorDificultad == 2{
                vista2 = CirculoD2Interpreta(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vista2)
            }
            else{
                vista3 = CirculoD3InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vista3)
            }
            labFig.text = "Círculo"
        case 1:
            if contadorDificultad == 1{
                vistaP1 = ParabolaD1InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaP1)
            }
            else if contadorDificultad == 2{
                vistaP2 = ParabolaD2InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaP2)
            }
            else{
                vistaP3 = ParabolaD3InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaP3)
                
            }
            labFig.text = "Parábola"
        case 2:
            if contadorDificultad == 1{
                vistaH1 = HiperbolaD1InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaH1)
                
            }
            else if contadorDificultad == 2{
                vistaH2 = HiperbolaD2InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaH2)
                
            }
            else{
                vistaH3 = HyperboleD3InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaH3)
                
            }
            labFig.text = "Hipérbola"
        case 3:
            if contadorDificultad == 1{
                vistaE1 = ElipseD1InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaE1)
            }
            else if contadorDificultad == 2{
                vistaE2 = ElipseD2InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaE2)
            }
            else{
                vistaE3 = ElipseD3InterpretaController(frame: CGRect(x: ValorX, y: ValorY, width: 250, height: 321))
                view.addSubview(vistaE3)
            }
            labFig.text = "Elipse"
        default:
            labFig.text = ""
        }
    }
    func assignbackground(){
        let background = UIImage(named: "NotebookWallpaper")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    @IBAction func incrementarDificultad(_ sender: UIButton) {
        butDificultadMenor.isHidden = false
        if contadorDificultad<3{
            butDificultadMayor.isHidden = false
            contadorDificultad += 1
            self.pickerView(pickerV, didSelectRow: pickerRow, inComponent: 0)
        }
        if contadorDificultad == 3 {
            butDificultadMayor.isHidden = true
        }
    }
    @IBAction func reducirDificultad(_ sender: UIButton) {
        butDificultadMayor.isHidden = false
        if contadorDificultad>1{
            butDificultadMenor.isHidden = false
            contadorDificultad -= 1
            self.pickerView(pickerV, didSelectRow: pickerRow, inComponent: 0)
        }
        
        if contadorDificultad == 1 {
            butDificultadMenor.isHidden = true
        }
    }
    func removeSubviews(){
        vista.removeFromSuperview()
        vista2.removeFromSuperview()
        vista3.removeFromSuperview()
        vistaP1.removeFromSuperview()
        vistaP2.removeFromSuperview()
        vistaP3.removeFromSuperview()
        vistaE1.removeFromSuperview()
        vistaE2.removeFromSuperview()
        vistaE3.removeFromSuperview()
        vistaH1.removeFromSuperview()
        vistaH2.removeFromSuperview()
        vistaH3.removeFromSuperview()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
