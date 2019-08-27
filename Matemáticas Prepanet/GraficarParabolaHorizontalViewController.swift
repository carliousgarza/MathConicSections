//
//  GraficarParabolaHorizontalViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/6/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import Charts

class GraficarParabolaHorizontalViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var lineView : LineChartView!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfConstant: UITextField!
    @IBOutlet weak var buttonCalcular: UIButton!
    
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func quitarTeclado2(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func handleCalcular(_ sender: UIButton) {
        lineView.isHidden = false

        //LINEA 1 --------------------------------------------------------
        var valorx = [Double]()
        var valory = [0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0]
        
        guard let valorH = Double(tfH.text!) else {return}
        guard Double(tfConstant.text!) != nil else {return}
        guard Double(tfA.text!) != nil else {return}
     
        for i in 0..<11 {
            valory[i] += valorH
        }

        for i in 0 ..< 11 {
            valorx.append(Double(tfA.text!)! * pow(valory[i] - Double(tfH.text!)!, 2.0) + Double(tfConstant.text!)!)
        }
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 11 {
            yValues.append(ChartDataEntry(x: valorx[i], y: valory[i]))
        }
        
        //LINEA 2 ----------------------------------------------------------------------------
        var valorx2 = [Double]()
        var valory2 = [0.0,-1.0,-2.0,-3.0,-4.0,-5.0,-6.0,-7.0,-8.0,-9.0,-10.0]
        
        for i in 0..<11 {
            valory2[i] += valorH
        }
 
        for i in 0 ..< 11 {
            valorx2.append(Double(tfA.text!)! * pow(valory2[i] - Double(tfH.text!)!, 2.0) + Double(tfConstant.text!)!)
        }
        
        var yValues2 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 11 {
            yValues2.append(ChartDataEntry(x: valorx2[i], y: valory2[i]))
        }
        
        let data = LineChartData()
        let ds = LineChartDataSet(values: yValues, label: "Valores de Y")
        ds.lineWidth = 10.0
        let ds2 = LineChartDataSet(values: yValues2, label: nil)
        ds2.lineWidth = 10.0
        data.addDataSet(ds)
        data.addDataSet(ds2)
        ds.colors = [NSUIColor.white]
        ds.circleColors = [NSUIColor.white]
        ds.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        ds2.colors = [NSUIColor.white]
        ds2.circleColors = [NSUIColor.white]
        ds2.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        self.lineView.xAxis.axisMinimum = valorx[0] - 10
        self.lineView.xAxis.axisMaximum = valorx[10] + 10
        self.lineView.data = data
        self.lineView.animate(xAxisDuration: 1)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
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
