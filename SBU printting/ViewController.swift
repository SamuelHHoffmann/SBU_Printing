//
//  ViewController.swift
//  SBU printting
//
//  Created by Samuel Hoffmann on 1/27/19.
//  Copyright © 2019 Samuel Hoffmann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var printerViewController = PrinterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.purple
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button_clicked(_ sender: Any) {
        
        var printer = Printer(printerURL: "130.245.251.127")
        
        printerViewController.loadPrinter(printer: printer)
        
        var seg = UIStoryboardSegue(identifier: "showPrinter", source: self, destination: printerViewController)
        
        
        
        performSegue(withIdentifier: "showPrinter", sender: self)
        
    }
    
}

