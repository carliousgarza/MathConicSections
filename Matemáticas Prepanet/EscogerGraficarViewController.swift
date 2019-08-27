//
//  EscogerGraficarViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 11/6/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class EscogerGraficarViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var buttonContinuar: UIButton!
    
    let pickerData = ["Parábola Vertical","Parábola Horizontal", "Hipérbola Vertical", "Hipérbola Horizontal", "Elipse Vertical", "Elipse Horizontal", "Círculo"]
    
    var choicePicked : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
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
    
    @IBAction func handleContinuar(_ sender: UIButton) {
        if choicePicked == 0{
            performSegue(withIdentifier: "parabolavert", sender: self)
        }
        else if choicePicked == 1{
            performSegue(withIdentifier: "parabolahor", sender: self)
        }
        else if choicePicked == 2{
            performSegue(withIdentifier: "hiperbolavert", sender: self)
        }
        else if choicePicked == 3{
            performSegue(withIdentifier: "hiperbolahor", sender: self)
        }
        else if choicePicked == 4{
            performSegue(withIdentifier: "elipsever", sender: self)
        }
        else if choicePicked == 5{
            performSegue(withIdentifier: "elipsehor", sender: self)
        }
        else if choicePicked == 6{
            performSegue(withIdentifier: "circulo", sender: self)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.choicePicked = row
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view {
            label = v as! UILabel
        }
        label.font = UIFont (name: "Chalkduster", size: 20)
        label.textColor = UIColor.white
        label.text =  pickerData[row]
        label.textAlignment = .center
        return label
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
