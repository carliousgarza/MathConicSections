//
//  CreadoresViewController.swift
//  Matemáticas Prepanet
//
//  Created by Carlos Fernando Garza Martinez on 10/17/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class CreadoresViewController: UIViewController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    @IBOutlet weak var buttonVolver: UIBarButtonItem!
    @IBOutlet weak var lbTitulo: UILabel!
    
    var sTitulo : String!
    
    
    @IBAction func handleVolver(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignbackground()
        // Do any additional setup after loading the view.
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
