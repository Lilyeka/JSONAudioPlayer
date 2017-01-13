//
//  ProductsTableViewController.swift
//  GoodAsPhone
//
//  Created by Dmitry Torshin on 30.11.16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit
import SwiftyJSON


class ProductsTableViewController: UITableViewController {
    
    var products = [Product]()
    var NumOfRows = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProduct"{
            let destinationVC = segue.destination as? ProductViewController
            
            
            guard let cell = sender as? UITableViewCell,
                  let indexPath1 = tableView.indexPath(for: cell) // instead of 2 if statements
            else {
                return
            }
            
            destinationVC?.product = products[indexPath1.row]
            
        }
    }
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        parseJSON()
   
    }
    
    func parseJSON(){
        
        let path:String = Bundle.main.path(forResource: "ProductsList", ofType: "json") as String!
        do {
            let jsonData = try NSData(contentsOfFile: path) as Data
            let readbleJSON = JSON(data: jsonData, options: JSONSerialization.ReadingOptions.mutableContainers , error: nil)
            NumOfRows = readbleJSON["Products"].count
            //NSLog("\(NumOfRows)")
          for i in 1...NumOfRows {
            
                let ProductI = "Product" + "\(i)"
                let Name = readbleJSON["Products",ProductI,"name"].rawString()
                let CellImage = readbleJSON["Products",ProductI,"cellImage"].rawString()
                let ProductImage = readbleJSON["Products",ProductI,"productImage"].rawString()
                let MusicName = readbleJSON["Products",ProductI,"musicName"].rawString()
                let MusicType = readbleJSON["Products",ProductI,"musicType"].rawString()
                let CurrentProduct = Product(Name: Name!, productImage: ProductImage!, cellImage: CellImage!, sound: PlayMusic(nameOfResource: MusicName!, nameOfType:MusicType!))
          
            products.insert(CurrentProduct, at: (i-1))// = [CurrentProduct]
        
        }
     
            
        }
        catch{}
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       return 1
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return products.count
     
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)

        // Configure the cell...
        
        
         let product = products[indexPath.row]//
    
            cell.textLabel?.text = product.Name
            cell.textLabel?.textColor = UIColor.blue
            if let i = product.cellImage{
                cell.imageView?.image = UIImage(named: i)
        
        }
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
