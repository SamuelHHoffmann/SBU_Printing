//
//  PrinterListViewController.swift
//  SBU printting
//
//  Created by Samuel Hoffmann on 2/8/19.
//  Copyright © 2019 Samuel Hoffmann. All rights reserved.
//

import Foundation
import UIKit

class PrinterListViewController: UITableViewController {
    
    let printerList : [String] = ["130.245.251.127","130.245.251.127","130.245.251.127","130.245.251.127","130.245.251.127"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "printerCell") as! printerCell
        
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.printerList.count
    }
    
    
}
