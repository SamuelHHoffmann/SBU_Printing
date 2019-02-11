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
    
    @IBOutlet weak var printerListTableView: UITableView!
    
    let printerList : [Printer] = [Printer(printerURL: "172.16.9.4")]
    
    private var tappedRow = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        printerListTableView.delegate = self
        printerListTableView.dataSource = self
        
        self.view.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        
        for printer in printerList {
            var status = printer.getPrinterStatus(natural: false)
            
            
        }
    }
    
    
    @IBAction func button_clicked(_ sender: Any) {
        
        var printer = Printer(printerURL: "130.245.251.127")
        
        printerViewController.loadPrinter(printer: printer)
        
        
        
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPrinter"{
            let dest = segue.destination as! PrinterViewController
            dest.loadPrinter(printer: printerList[tappedRow])
        }
    }
    
    
}





extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "printerCell") as! printerCell
        cell.nameLabel.text = printerList[indexPath.row].getPrinterName()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.printerList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //send data first
        tappedRow = indexPath.row
        performSegue(withIdentifier: "showPrinter", sender: self)
    }
    
    
    
}
