//
//  Printer.swift
//  SBU printting
//
//  Created by Samuel Hoffmann on 1/27/19.
//  Copyright © 2019 Samuel Hoffmann. All rights reserved.
//

import Foundation
import CoreLocation

class Printer {
    
    //holds information about a printer
    
    private let printerURL : String
    private let isEmpty : Bool
    
    private var printerStatus : Int //-1 not actual printer, 0 = good, 1 = declining, 2 = down
    
    private var lastUpdate : TimeInterval
    private var RefeshEveryXMin : Double
    
    private var printerName = "empty"
    //private var printerLocation : CLLocation
    
    init() {
        self.isEmpty = true
        self.printerURL = "empty"
        self.printerStatus = -1
        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
        self.RefeshEveryXMin = 5
    }
    
    init(printerURL: String){
        self.printerURL = printerURL
        self.isEmpty = false
        self.printerStatus = 0
        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
        self.RefeshEveryXMin = 5
        self.refreshPrinter()
    }
    
    
    
    
    
    
//    private func refreshPrinter(){
//        if(!self.isEmpty){
//            
//            self.printerStatus = 0
//            self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
//            
//            if self.printerName == "empty" {
//                //set printer name
//                self.printerName = "TempEmpty"
//                    
//            }
//        }else{}
//    }
    
    
    //sorry mickey for my testing
    private func refreshPrinter(){
        if(!self.isEmpty){
            var urlString = "http://"+self.printerURL+"/status.html"

            let url = URL(string: urlString)!

            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                defer {  }
                guard
                    let data = data,
                    error == nil,
                    let document = String(data: data, encoding: .utf8) else { return }
                    print(document)
                //TODO: grab name

                if document.contains("green.jpg") {
                    DispatchQueue.main.async {
                        self.printerStatus = 0
                        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
                    }
                }else if document.contains("yellow.jpg") {
                    DispatchQueue.main.async {
                        self.printerStatus = 1
                        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
                    }

                }else if document.contains("red.jpg") {
                    DispatchQueue.main.async {
                        self.printerStatus = 2
                        self.lastUpdate = NSDate.timeIntervalSinceReferenceDate
                    }
                }

                if self.printerName == "empty" {
                    //set printer name
                    //TODO: not sure how to make regex to find the name of the printer but I will do it.
//                    let html = document as NSString
//
//
//                    let regex = try? NSRegularExpression(pattern: "<TD id=text2>(*)<", options: .caseInsensitive)
//
//                    let matches = regex?.matches(in: document, options: [], range: NSRange(location: 0, length: html.length))
//
//                    print(matches?.count)
//                    document.index(of: "")
                    
                }


            }
            task.resume()
        }else{}
    }
    
    
    
    public func getPrinterStatus(natural: Bool) -> Int { //natrual will refesh if time has passed, false will force it to refresh right now regardless
        if natural {
            //if last update is too long refesh and then update
            let currentTime = NSDate(timeIntervalSinceReferenceDate: NSDate.timeIntervalSinceReferenceDate)
            let oldTime = NSDate(timeIntervalSinceReferenceDate: lastUpdate)
            
            let minSinceLastUpdate = currentTime.timeIntervalSince(oldTime as Date)/60
            
            if(RefeshEveryXMin <= minSinceLastUpdate){
                refreshPrinter()
            }
            
        }else{
            refreshPrinter()
        }
        return self.printerStatus
    }
    
    func getPrinterName() -> String{
        return printerName
    }
    
    func getPrinterURL() -> String{
        return printerURL
    }
    
}




