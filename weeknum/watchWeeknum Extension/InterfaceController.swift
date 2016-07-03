//
//  InterfaceController.swift
//  watchWeeknum Extension
//
//  Created by Sergii Nezdolii on 02/07/16.
//  Copyright © 2016 FrostDigital. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var dateDetailsLabel: WKInterfaceLabel!
    @IBOutlet var weekInfoLabel: WKInterfaceLabel!
    @IBOutlet var weekNumberLabel: WKInterfaceLabel!
    var currentDate: NSDate = NSDate()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        updateForToday()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    private func updateUIWithDate(date: NSDate?) {
        guard let date = date else {return}
        currentDate = date
        self.dateDetailsLabel.setText(FormatterUtils.formattedDate(currentDate))
        if let weekInfo = FormatterUtils.getWeekInfo(currentDate) {
            self.weekInfoLabel.setText(weekInfo)
        } else {
            self.weekInfoLabel.setText(nil)
        }
        if let weekNumber = currentDate.weekNumber() {
            self.weekNumberLabel.setText(String(weekNumber))
        } else {
            self.weekNumberLabel.setText(nil)
        }
    }

    @IBAction func updateForToday() {
        updateUIWithDate(NSDate())
    }
    
    @IBAction func updateForPreviousWeek() {
        updateUIWithDate(currentDate.weekBefore())
    }
    
    @IBAction func updateForNextWeek() {
        updateUIWithDate(currentDate.weekAfter())
    }
}
