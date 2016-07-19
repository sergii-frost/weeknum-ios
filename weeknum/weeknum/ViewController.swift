//
//  ViewController.swift
//  weeknum
//
//  Created by Sergii Nezdolii on 02/07/16.
//  Copyright © 2016 FrostDigital. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weekInfoLabel: UILabel!
    @IBOutlet weak var weekNumberLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.updateForToday), name: UIApplicationDidBecomeActiveNotification, object: nil)
        setupDatePicker()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        updateForToday()
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    //MARK: - Date Picker setup
    
    private func setupDatePicker() {
        datePicker.setValue(UIColor.whiteColor(), forKey: "textColor")
        datePicker.sendAction("setHighlightsToday:", to: nil, forEvent: nil)
    }
    
    @IBAction func updateForToday() {
        self.datePicker.date = NSDate()
        datePickerChangedValue(self.datePicker)
    }
    
    @IBAction func updateForNextWeek() {
        if let nextWeekDate = self.datePicker.date.nextWeekStart() {
            self.datePicker.date = nextWeekDate
            datePickerChangedValue(self.datePicker)
        }
    }
    
    @IBAction func updateForPreviousWeek() {
        if let previousWeekDate = self.datePicker.date.lastWeekStart() {
            self.datePicker.date = previousWeekDate
            datePickerChangedValue(self.datePicker)
        }
    }

    
    @IBAction func datePickerChangedValue(datePickerWithNewValue: UIDatePicker) {
        updateUIWithDate(datePickerWithNewValue.date)
    }
    
    //MARK: - UI related methods
    
    private func updateUIWithDate(date: NSDate) {
        if  let formattedDate = FormatterUtils.formattedDate(date) {
            self.dateLabel.fadeTransition()
            self.dateLabel.text = formattedDate
        } else {
            self.dateLabel.text = nil
        }
        
        if let weekInfo = FormatterUtils.getWeekInfo(date) {
            self.weekInfoLabel.fadeTransition()
            self.weekInfoLabel.text = weekInfo
        } else {
            self.weekInfoLabel.text = nil
        }
        
        if let weekNumber = date.weekNumber() {
            self.weekNumberLabel.fadeTransition()
            self.weekNumberLabel.text = String(weekNumber)
        } else {
            self.weekNumberLabel.text = nil
        }
        
    }
}

