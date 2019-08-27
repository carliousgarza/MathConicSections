//
//  FormulaViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 10/17/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class FormulaViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var buttonVolver: UIBarButtonItem!
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var imgFormula: UIImageView!
    @IBOutlet weak var txtView: UITextView!
    
    var tipoFormula : String!
    var imagenActual : UIImage!
    var imagenFormula : UIImage!
    var sTitulo : String!
    
    
    @IBAction func handleVolver(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        
        if tipoFormula == "Círculo" {
            lbTitulo.text = "Círculo"
            txtView.text = "Ec: (x – h)^2 + (y – k)^2 = r^2\n Centro: (h,k)\n Radio: r\n"
           
            imgFormula.image = UIImage(named: "circulo-2")
            
        } else if tipoFormula == "Parábola Vertical" {
            lbTitulo.text = "Parábola Vertical"
            txtView.text = "Ec: y = a(x – h)^2 + k\n Vertice: (h, k)"
            imgFormula.image = UIImage(named: "parabolaver")
           
        } else if tipoFormula == "Parábola Horizontal" {
            lbTitulo.text = "Parábola Horizontal"
            txtView.text = "Ec: a(y – k)^2 + h\n Vertice: (h, k)"
            imgFormula.image = UIImage(named: "parabolahor")
        } else if tipoFormula == "Hipérbole Vertical" {
            lbTitulo.text = "Hipérbole Vertical"
            txtView.text = "Ec: ((y-k)^2)/a^2  -  ((x-h)^2)/b^2  =  1\n Centro: (h, k)\n a = distancia fija del centro a los vértices\n c = distancia fija del centro a los focos\n c^2 = a^2 + b^2"
            imgFormula.image = UIImage(named: "hiperbolaver")
            
        } else if tipoFormula == "Hipérbole Horizontal" {
            lbTitulo.text = "Hipérbole Horizontal"
            txtView.text = "Ec: ((x-h)^2)/a^2  -  ((y-k)^2)/b^2  =  1\n Centro: (h, k)\n a = distancia fija del centro a los vértices\n c = distancia fija del centro a los focos\n c^2 = a^2 + b^2"
            imgFormula.image = UIImage(named: "hiperbolahor")
        
        } else if tipoFormula == "Elipse Vertical"  {
            lbTitulo.text = "Elipse Vertical"
            txtView.text = "Ec: ((y-k)^2)/a^2  +  ((x-h)^2)/b^2  =  1\n Centro: (h, k)\n a = distancia fija del centro a los vértices\n c = distancia fija del centro a los focos\n c^2 = a^2 - b^2"
        
            imgFormula.image = UIImage(named: "elipsever")
           
        } else if tipoFormula == "Elipse Horizontal" {
            lbTitulo.text = "Elipse Horizontal"
           txtView.text = "Ec: ((x-h)^2)/a^2  +  ((y-k)^2)/b^2  =  1\n Centro: (h, k)\n a = distancia fija del centro a los vértices\n c = distancia fija del centro a los focos\n c^2 = a^2 - b^2"
            imgFormula.image = UIImage(named: "elipsehor")
           
        }
        imgFormula.layer.borderWidth = 1
        imgFormula.layer.masksToBounds = false
         imgFormula.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
    }
    func assignbackground(){
        let background = UIImage(named: "chalkboardwp")
        
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
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
