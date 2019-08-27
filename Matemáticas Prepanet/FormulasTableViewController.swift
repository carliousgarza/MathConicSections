//
//  FormulasTableViewController.swift
//  Matemáticas Prepanet
//
//  Created by Patricio Gutierrez on 10/31/18.
//  Copyright © 2018 Carlos Fernando Garza Martinez. All rights reserved.
//

import UIKit

class FormulasTableViewController: UITableViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    override var shouldAutorotate: Bool {
        return false
    }
    var arrTipoEcu : [String] = ["Parábola Vertical", "Parábola Horizontal","Hipérbole Vertical","Hipérbole Horizontal","Elipse Vertical","Elipse Horizontal", "Círculo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 100
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrTipoEcu.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        cell.textLabel?.text = arrTipoEcu[indexPath.row]
        if(indexPath.row == 0){
            cell.imageView?.image = #imageLiteral(resourceName: "one")
        }
        else if(indexPath.row == 1){
            cell.imageView?.image = #imageLiteral(resourceName: "two")
        }
        else if(indexPath.row == 2){
            cell.imageView?.image = #imageLiteral(resourceName: "three")
        }
        else if(indexPath.row == 3){
            cell.imageView?.image = #imageLiteral(resourceName: "four")
        }
        else if(indexPath.row == 4){
            cell.imageView?.image = #imageLiteral(resourceName: "five")
        }
        else if(indexPath.row == 5){
            cell.imageView?.image = #imageLiteral(resourceName: "six")
        }
        else if(indexPath.row == 6){
            cell.imageView?.image = #imageLiteral(resourceName: "seven")
        }
        cell.textLabel?.font = UIFont(name: "Avenir", size: 22)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let indice = tableView.indexPathForSelectedRow!
        let vistaFormula = segue.destination as! FormulaViewController
        vistaFormula.tipoFormula = arrTipoEcu[indice.row]
    }
    

}
