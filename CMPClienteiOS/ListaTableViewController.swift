//
//  ListaTableViewController.swift
//  CMPClienteiOS
//
//  Created by Leo Picado on 3/24/15.
//  Copyright (c) 2015 LeoPicado. All rights reserved.
//

import UIKit

class ListaTableViewController: UITableViewController {
    
    let basePath = "http://boot2docker:4000/api/carros"
    var carros = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request(.GET, basePath + "/")
            .responseJSON { (_, _, JSON, _) in
                if let carrosDelBackend = JSON as? [AnyObject] {
                    for carro in carrosDelBackend {
                        if let marca = carro.valueForKey("marca") as? String {
                            if let modelo = carro.valueForKey("modelo") as? String {
                                let nombre = marca + " " + modelo
                                self.carros.append(nombre)
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carros.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = carros[indexPath.row]
        return cell
    }
    
}
