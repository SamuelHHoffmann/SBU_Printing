//
//  PrinterViewController.swift
//  SBU printting
//
//  Created by Samuel Hoffmann on 1/27/19.
//  Copyright © 2019 Samuel Hoffmann. All rights reserved.
//

import Foundation
import UIKit


class PrinterViewController: UIViewController {

    private var printer = Printer()
    private var printerLoaded = false
    
    @IBOutlet weak var PrinterStatusImage: UIImageView!
    
    @IBOutlet weak var PrinterStatusLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tempPrint = Printer(printerURL: "130.245.251.127")
        loadPrinter(printer: tempPrint)
        
        
        let status = printer.getPrinterStatus(natural: true)
        
        if(status == 0){
            //good
            PrinterStatusImage.image = UIImage(named: "greenStatus")
            PrinterStatusLabel.text = "Printer Status: Good"
        }else if(status == 1){
            //eh
            PrinterStatusImage.image = UIImage(named: "yellowStatus")
            PrinterStatusLabel.text = "Printer Status: Okay"
        }else if(status == 2){
            //down
            PrinterStatusImage.image = UIImage(named: "redStatus")
            PrinterStatusLabel.text = "Printer Status: Down"
        }else{
            //error
        }
        
        
    }
    
    func loadPrinter(printer: Printer){
        //loads printer info into printer view controller
        self.printer = printer
        self.printerLoaded = true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(printer.getPrinterStatus(natural: true))
    }
    
    
    
    
}
