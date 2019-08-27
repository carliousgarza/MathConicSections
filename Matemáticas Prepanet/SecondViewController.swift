//
//  SecondViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 10/2/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaSiguiente = segue.destination as! FormulaViewController
        var sTituloSig = ""
        if segue.identifier == "circulo" {
            sTituloSig = "Círculo"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "circulo")
            vistaSiguiente.imagenFormula = UIImage(named: "formulacirculo")
        } else if segue.identifier == "parabolavertical" {
            sTituloSig = "Parábola Vertical"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "parabola")
            vistaSiguiente.imagenFormula = UIImage(named: "formulaparabolavertical")
        } else if segue.identifier == "parabolahorizontal" {
            sTituloSig = "Parábola Horizontal"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "parabola2")
            vistaSiguiente.imagenFormula = UIImage(named: "formulaparabolahorizontal")
        } else if segue.identifier == "hiperbolevertical" {
            sTituloSig = "Hipérbole Vertical"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "hiperbola")
            vistaSiguiente.imagenFormula = UIImage(named: "formulahiperbolevertical")
        } else if segue.identifier == "hiperbolehorizontal" {
            sTituloSig = "Hipérbole Horizontal"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "hiperbola")
            vistaSiguiente.imagenFormula = UIImage(named: "formulahiperbolehorizontal")
        } else if segue.identifier == "elipsevertical" {
            sTituloSig = "Elipse Vertical"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "elipse v")
            vistaSiguiente.imagenFormula = UIImage(named: "formulaelipsevertical")
        } else if segue.identifier == "elipsehorizontal" {
            sTituloSig = "Elipse Horizontal"
            vistaSiguiente.sTitulo = sTituloSig
            vistaSiguiente.imagenActual = #imageLiteral(resourceName: "elipse h")
            vistaSiguiente.imagenFormula = UIImage(named: "formulaelipsehorizontal")
        }
    }
    
}

