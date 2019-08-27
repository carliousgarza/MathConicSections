//
//  GraficarCirculoViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/6/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import Charts

class GraficarCirculoViewController: UIViewController {
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var lineView: LineChartView!
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfR: UITextField!
    @IBOutlet weak var buttonCalcular: UIButton!
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func quitarTeclado2(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    @IBAction func handleCalcular(_ sender: UIButton) {
        //TOP HALF OF CIRCLE
        lineView.isHidden = false
        var valory = [Double]()
        
        guard let valorH = Double(tfH.text!) else {return}
        guard Double(tfK.text!) != nil else {return}
        guard let valorR = Int(tfR.text!) else {return}
        let valorRNegativo = valorR * -1
        var valorx = [Double]()
        
        for i in valorRNegativo ..< valorR+1 {
            valorx.append(Double(i))
        }
        
        for i in 0..<valorx.count {
            valorx[i] += valorH
        }

        let valorMax = valorx.count
        
        for i in 0 ..< valorx.count {
            valory.append(sqrt(pow(Double(tfR.text!)!,2.0) - pow(valorx[i]-Double(tfH.text!)!,2.0) + Double(tfK.text!)!))
        }
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< valorx.count {
            yValues.append(ChartDataEntry(x: valorx[i], y: valory[i]))
        }
        
        
        //BOTTOM HALF OF CIRCLE
        var valory2 = [Double]()
        for i in 0 ..< valorx.count {
            valory2.append(-sqrt(pow(Double(tfR.text!)!,2.0) - pow(valorx[i]-Double(tfH.text!)!,2.0) + Double(tfK.text!)!))
        }
        var yValues2 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< valorx.count {
            yValues2.append(ChartDataEntry(x: valorx[i], y: valory2[i]))
        }
       
        let data = LineChartData()
        let ds = LineChartDataSet(values: yValues, label: "Valores de Y")
        let ds2 = LineChartDataSet(values: yValues2, label: nil)
        data.addDataSet(ds)
        data.addDataSet(ds2)
        ds.lineWidth = 10.0
        ds2.lineWidth = 10.0
        ds.colors = [NSUIColor.white]
        ds.circleColors = [NSUIColor.white]
        ds.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        ds2.colors = [NSUIColor.white]
        ds2.circleColors = [NSUIColor.white]
        ds2.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        self.lineView.xAxis.axisMinimum = valorx[0] - 2
        self.lineView.xAxis.axisMaximum = valorx[valorMax-1] + 2
        self.lineView.data = data
        self.lineView.animate(yAxisDuration: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
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
