//
//  GraficarHiperbolaVerticalViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/7/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import Charts

class GraficarHiperbolaVerticalViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var lineView: LineChartView!
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var buttonCalcular: UIButton!
    @IBOutlet weak var viewAlerta: UIView!
    @IBOutlet weak var lbAlerta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func quitarTeclado2(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func handleCalcular(_ sender: UIButton) {
        lineView.isHidden = false

        //LINEA POSITIVA
        var valory = [Double]()
        var valorx = [-10.0,-9.0,-8.0,-7.0,-6.0,-5.0,-4.0,-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0]
        
        guard let valorK = Double(tfK.text!) else {return}
        guard let valorH = Double(tfH.text!) else {return}
        guard let valorA = Double(tfA.text!) else {return}
        guard let valorB = Double(tfB.text!) else {return}
        
        if valorA == 0 || valorB == 0 {
            viewAlerta.isHidden = false
            lbAlerta.text = "No se puede dividir entre 0"
            return
        }
        else {
            lbAlerta.isHidden = true
        }
        
        for i in 0..<21 {
            valorx[i] += valorH
        }
        
        for i in 0 ..< 21 {
            valory.append((valorB * sqrt(pow(valorA,2.0) + pow(valorH,2.0) - (2*valorH*valorx[i]) + pow(valorx[i],2.0) ) / valorA) + valorK)
        }
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 21 {
            yValues.append(ChartDataEntry(x: valorx[i], y: valory[i]))
        }
        
        //LINEA NEGATIVA

        var valory2 = [Double]()
        
        for i in 0 ..< 21 {
            valory2.append(valorK - (valorB * sqrt(pow(valorA,2.0) + pow(valorH,2.0) - (2*valorH*valorx[i]) + pow(valorx[i],2.0) ) / valorA))
        }
        
        var yValues2 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 21 {
            yValues2.append(ChartDataEntry(x: valorx[i], y: valory2[i]))
        }
        
        let data = LineChartData()
        let ds = LineChartDataSet(values: yValues, label: "Valores de Y")
        let ds2 = LineChartDataSet(values: yValues2, label: nil)
        ds.lineWidth = 10.0
        ds2.lineWidth = 10.0
        data.addDataSet(ds)
        data.addDataSet(ds2)
        ds.colors = [NSUIColor.white]
        ds.circleColors = [NSUIColor.white]
        ds.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        ds2.colors = [NSUIColor.white]
        ds2.circleColors = [NSUIColor.white]
        ds2.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        self.lineView.xAxis.axisMinimum = valorx[0]
        self.lineView.xAxis.axisMaximum = valorx[20]
        self.lineView.data = data
        self.lineView.animate(yAxisDuration: 1)
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
    
}
