//
//  GraficarHiperbolaHorizontalViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/7/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import Charts

class GraficarHiperbolaHorizontalViewController: UIViewController {
    
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
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func quitarTeclado2(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()

    }
    
    @IBAction func handleCalcular(_ sender: UIButton) {
        lineView.isHidden = false

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
        
        //LINEA 1 IZQUIERDA ARRIBA
        var valorx = [Double]()
        var valory = [0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0]
        
        valory.reverse()
        
        for i in 0..<11 {
            valory[i] += valorK
        }
        
        for i in 0 ..< 11 {
            valorx.append(valorH - (valorA * sqrt(pow(valorB,2.0) + pow(valorK,2.0) - (2*valorK*valory[i]) + pow(valory[i],2.0)))/valorB)
        }
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 11 {
            yValues.append(ChartDataEntry(x: valorx[i], y: valory[i]))
        }
        
        //LINEA 2 DERECHA ARRIBA
        var valorx2 = [Double]()
        valory.reverse()
        
        for i in 0..<11 {
            valory[i] += valorK
        }
        
        for i in 0 ..< 11 {
            valorx2.append(((valorA * sqrt(pow(valorB,2.0) + pow(valorK,2.0) - (2*valorK*valory[i]) + pow(valory[i],2.0)))/valorB) + valorH)
        }
        
        var yValues2 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 11 {
            yValues2.append(ChartDataEntry(x: valorx2[i], y: valory[i]))
        }
        
        //LINEA 3 IZQUIERA ABAJO
        var valorx3 = [Double]()
        var valory2 = [0.0,-1.0,-2.0,-3.0,-4.0,-5.0,-6.0,-7.0,-8.0,-9.0,-10.0]
        valory2.reverse()
        
        for i in 0..<11 {
            valory2[i] += valorK
        }
        
        for i in 0 ..< 11 {
            valorx3.append(valorH - (valorA * sqrt(pow(valorB,2.0) + pow(valorK,2.0) - (2*valorK*valory2[i]) + pow(valory2[i],2.0)))/valorB)
        }
        
        var yValues3 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 11 {
            yValues3.append(ChartDataEntry(x: valorx3[i], y: valory2[i]))
        }
        
        //Linea 4 derecha abajo
        var valorx4 = [Double]()
        valory2.reverse()
        
        for i in 0..<11 {
            valory2[i] += valorK
        }
        
        for i in 0 ..< 11 {
            valorx4.append(((valorA * sqrt(pow(valorB,2.0) + pow(valorK,2.0) - (2*valorK*valory2[i]) + pow(valory2[i],2.0)))/valorB) + valorH)
        }
        
        var yValues4 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 11 {
            yValues4.append(ChartDataEntry(x: valorx4[i], y: valory2[i]))
        }
        
        //GRAFICAR
        let data = LineChartData()
        let ds = LineChartDataSet(values: yValues, label: "Valores de Y")
        let ds2 = LineChartDataSet(values: yValues2, label: nil)
        let ds3 = LineChartDataSet(values: yValues3, label: nil)
        let ds4 = LineChartDataSet(values: yValues4, label: nil)
        ds.lineWidth = 10.0
        ds2.lineWidth = 10.0
        ds3.lineWidth = 10.0
        ds4.lineWidth = 10.0
        data.addDataSet(ds)
        data.addDataSet(ds2)
        data.addDataSet(ds3)
        data.addDataSet(ds4)
        ds.colors = [NSUIColor.white]
        ds.circleColors = [NSUIColor.white]
        ds.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        ds2.colors = [NSUIColor.white]
        ds2.circleColors = [NSUIColor.white]
        ds2.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        ds3.colors = [NSUIColor.white]
        ds3.circleColors = [NSUIColor.white]
        ds3.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        ds4.colors = [NSUIColor.white]
        ds4.circleColors = [NSUIColor.white]
        ds4.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        self.lineView.xAxis.axisMinimum = valorx[0] - 2
        self.lineView.xAxis.axisMaximum = valorx2[10] + 2
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
