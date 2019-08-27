//
//  GraficarElipseVerticalViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/7/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit
import Charts

class GraficarElipseVerticalViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var lineView: LineChartView!
    @IBOutlet weak var tfH: UITextField!
    @IBOutlet weak var tfK: UITextField!
    @IBOutlet weak var tfB: UITextField!
    @IBOutlet weak var tfA: UITextField!
    @IBOutlet weak var btnCalc: UIButton!
    @IBOutlet weak var lbP2: UILabel!
    @IBOutlet weak var lbS2: UILabel!
    @IBOutlet weak var lbAlerta: UILabel!
    @IBOutlet weak var viewAlerta: UIView!
    
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
            lbP2.isHidden = true
            lbS2.isHidden = true
            lbAlerta.text = "No se puede dividir entre 0"
            return
        }
        else if pow(valorA, 2.0) <= pow(valorB, 2.0) {
            viewAlerta.isHidden = false
            lbAlerta.text = "a   debe de ser mayor que b"
            lbP2.isHidden = false
            lbS2.isHidden = false
            return
        }
        else if pow(valorA, 2.0) > pow(valorB, 2.0){
            viewAlerta.isHidden = true
            lbP2.isHidden = true
            lbS2.isHidden = true
        }
        
        //Parte de arribe de elipse
        var valory = [Double]()
        var valorx = [Double]()
        
        for i in -Int(valorB)..<Int(valorB)+1 {
            valorx.append(Double(i))
        }
        
        for i in 0..<valorx.count {
            valorx[i] += valorH
        }
        
        for i in 0..<valorx.count {
            valory.append((valorA * sqrt(pow(valorB, 2.0) - pow(valorH, 2.0) + (2.0*valorH*valorx[i]) - pow(valorx[i], 2.0)) / valorB) + valorK)
        }
        
        var yValues : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< valorx.count {
            yValues.append(ChartDataEntry(x: valorx[i], y: valory[i]))
        }
        
        //Parte de abajo de elipse
        var valory2 = [Double]()
        
        for i in 0..<valorx.count {
            valory2.append(valorK - (valorA * sqrt(pow(valorB, 2.0) - pow(valorH, 2.0) + (2.0*valorH*valorx[i]) - pow(valorx[i], 2.0)) / valorB))
        }
        
        var yValues2 : [ChartDataEntry] = [ChartDataEntry]()
        
        for i in 0 ..< valorx.count {
            yValues2.append(ChartDataEntry(x: valorx[i], y: valory2[i]))
        }
        
        //GRAFICAR
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
        self.lineView.xAxis.axisMinimum = valorx[0]-2
        self.lineView.xAxis.axisMaximum = valorx[valorx.count-1]+2
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
