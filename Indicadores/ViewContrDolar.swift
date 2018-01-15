//
//  ViewContrDolar.swift
//  Indicadores
//
//  Created by Jose David Bustos H on 14-01-18.
//  Copyright © 2018 Jose David Bustos H. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SystemConfiguration

class ViewContrDolar: UIViewController {
    var str_mensaje:String = "";
    var mutableData:NSMutableData  = NSMutableData()
    var names: [String] = []
    var rating: [String] = []
    
    var visits: [String] = []
    var gones: [String] = []
    var alarmas: [String] = []
    var waits: [String] = []
    

    @IBOutlet weak var LblDolar: UILabel!
    
    @IBOutlet weak var LblDolarObservado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url=URL(string:"https://mindicador.cl/api");
        do {
            
            let allContactsData = try Data(contentsOf: url!)
            let allContacts = try JSONSerialization.jsonObject(with: allContactsData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["dolar"] {
                for index in 0...arrJSON.count-1 {
                    
                    let aObject = arrJSON[index] as! [String : AnyObject]
                    
                    names.append(aObject["nombre"] as! String)
                  //  rating.append(aObject["ID"] as! String)
                  //  gones.append(aObject["Left"] as! String)
                  //  waits.append(aObject["Wait"] as! String)
                  //  visits.append(aObject["Count"] as! String)
                }
            }else{
                
                str_mensaje = "No se encontraror datos "
                let alert = UIAlertController(title: "Alert", message: str_mensaje, preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
          //  print(names)
          //  print(rating)
            
          //  self.tableView.reloadData()
        }
        catch {
            str_mensaje = "No se encontraror datos "
            let alert = UIAlertController(title: "Alert", message: str_mensaje, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
