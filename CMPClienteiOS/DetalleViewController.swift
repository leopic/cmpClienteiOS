//
//  FirstViewController.swift
//  CMPClienteiOS
//
//  Created by Leo Picado on 3/24/15.
//  Copyright (c) 2015 LeoPicado. All rights reserved.
//

import UIKit

class DetalleViewController: UIViewController {

    let basePath = "http://boot2docker:4000/api/carros"
    
    @IBOutlet weak var lblModelo: UILabel!
    @IBOutlet weak var lblMarca: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request(.GET, basePath + "/5")
            .responseJSON { (_, _, JSON, _) in
                if let carro: AnyObject = JSON {
                    self.lblMarca.text = carro.valueForKey("marca") as String!
                    self.lblModelo.text = carro.valueForKey("modelo") as String!
                }
        }
    }


}

