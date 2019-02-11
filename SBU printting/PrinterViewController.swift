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

    public var printer = Printer()
    private var printerLoaded = false
    
    private var rotateAngle = 720
    
    @IBOutlet weak var PrinterStatusImage: UIImageView!
    
    @IBOutlet weak var PrinterStatusLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBOutlet weak var printerNameLabel: UILabel!
    
    @IBAction func BackButtonPressed(_ sender: Any) {
        //go back
        performSegue(withIdentifier: "printerToMain", sender: self)
    }
    
    @IBAction func refreshButtonPressed(_ sender: Any) {
        //refresh printer
        

        UIView.animate(withDuration: 0.25, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.refreshButton.transform = CGAffineTransform(rotationAngle: CGFloat(self.rotateAngle))
            self.PrinterStatusImage.transform = CGAffineTransform(translationX: 0, y: -42)
            self.PrinterStatusLabel.transform = CGAffineTransform(translationX: 0, y: -42)
        }, completion: nil)
        
       
        
        self.rotateAngle = self.rotateAngle + 720 //can potentially crash app when reaches max int
        
        refreshPrinter(forced: true)
        
    }
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        refreshPrinter(forced: false)
        self.printerNameLabel.text = self.printer.getPrinterName()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    private func refreshPrinter(forced: Bool){
        
        
        
        let status = printer.getPrinterStatus(natural: !forced)
        
        if(status == 0){
            //good
            PrinterStatusImage.image = UIImage(named: "greenStatus")
            PrinterStatusLabel.text = "Printer Status: Good"
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.PrinterStatusImage.transform = CGAffineTransform(translationX: 0, y: 42)
                self.PrinterStatusLabel.transform = CGAffineTransform(translationX: 0, y: 42)
            }, completion: nil)
            
        }else if(status == 1){
            //eh
            PrinterStatusImage.image = UIImage(named: "yellowStatus")
            PrinterStatusLabel.text = "Printer Status: Okay"
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.PrinterStatusImage.transform = CGAffineTransform(translationX: 0, y: 42)
                self.PrinterStatusLabel.transform = CGAffineTransform(translationX: 0, y: 42)
            }, completion: nil)
            
        }else if(status == 2){
            //down
            PrinterStatusImage.image = UIImage(named: "redStatus")
            PrinterStatusLabel.text = "Printer Status: Down"
            
            UIView.animate(withDuration: 0.5, delay: 0, options: UIView.AnimationOptions.curveEaseIn, animations: {
                self.PrinterStatusImage.transform = CGAffineTransform(translationX: 0, y: 42)
                self.PrinterStatusLabel.transform = CGAffineTransform(translationX: 0, y: 42)
            }, completion: nil)
            
        }else{
            //error
        }
        
        
        
    }
    
    
    
    func loadPrinter(printer: Printer){
        //loads printer info into printer view controller
        self.printer = printer
        self.printerLoaded = true
        
    }
    
    
    
    
    
    
    
}
