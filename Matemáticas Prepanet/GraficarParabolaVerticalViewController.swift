//
//  GraficarParabolaVerticalViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 10/31/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import Charts

class GraficarParabolaVerticalViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var lineView : LineChartView!
    @IBOutlet weak var tfX: UITextField!
    @IBOutlet weak var tfConstant: UITextField!
    @IBOutlet weak var buttonCalcular: UIButton!
    @IBOutlet weak var tfH: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
    }
    
    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    
    @IBAction func quitaTeclado2(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
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
    
    @IBAction func handleCalcular(_ sender: Any) {
        lineView.isHidden = false
        var valory = [Double]()
        var valorx = [-10.0,-9.0,-8.0,-7.0,-6.0,-5.0,-4.0,-3.0,-2.0,-1.0,0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0]
        
        guard let valorH = Double(tfH.text!) else {return}
        guard Double(tfConstant.text!) != nil else {return}
        guard Double(tfX.text!) != nil else {return}
        
        for i in 0..<21 {
            valorx[i] += valorH
        }
        
        for i in 0 ..< 21 {
            valory.append(Double(tfX.text!)! * pow(valorx[i] - Double(tfH.text!)!, 2.0) + Double(tfConstant.text!)!)
        }
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< 21 {
            yValues.append(ChartDataEntry(x: valorx[i], y: valory[i]))
        }
        
        let data = LineChartData()
        let ds = LineChartDataSet(values: yValues, label: "Valores de Y")
        ds.lineWidth = 10.0
        ds.colors = [NSUIColor.white]
        ds.circleColors = [NSUIColor.white]
        ds.circleHoleColor = #colorLiteral(red: 0.430556953, green: 0.704677403, blue: 0.4594219327, alpha: 1)
        data.addDataSet(ds)
        self.lineView.xAxis.axisMinimum = valorx[0]
        self.lineView.xAxis.axisMaximum = valorx[20]
        self.lineView.data = data
        self.lineView.animate(yAxisDuration: 1)
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
