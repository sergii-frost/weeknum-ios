//
//  weeknumTests.swift
//  weeknumTests
//
//  Created by Sergii Nezdolii on 02/07/16.
//  Copyright © 2016 FrostDigital. All rights reserved.
//

import XCTest
@testable import Week_

class weeknumTests: XCTestCase {
    
    let dateFormat = "dd MM yyyy"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDaysAfterDate() {
        //GIVEN
        guard
            let date = FormatterUtils.dateFromString("03 Jul 2016", dateFormat: dateFormat),
            let expected1DayAfter = FormatterUtils.dateFromString("04 Jul 2016", dateFormat: dateFormat),
            let expected2DaysAfter = FormatterUtils.dateFromString("05 Jul 2016", dateFormat: dateFormat),
            let expected7DaysAfter = FormatterUtils.dateFromString("10 Jul 2016", dateFormat: dateFormat),
            let expected30DaysAfter = FormatterUtils.dateFromString("02 Aug 2016", dateFormat: dateFormat)
            else { XCTFail(); return}
        //WHEN
        //THEN
        XCTAssertEqual(expected1DayAfter, date.dayAfter())
        XCTAssertEqual(expected2DaysAfter, date.daysAfter(2))
        XCTAssertEqual(expected7DaysAfter, date.daysAfter(7))
        XCTAssertEqual(expected30DaysAfter, date.daysAfter(30))
    }
    
    func testDaysBeforeDate() {
        //GIVEN
        guard
            let date = FormatterUtils.dateFromString("03 Jul 2016", dateFormat: dateFormat),
            let expected1DayBefore = FormatterUtils.dateFromString("02 Jul 2016", dateFormat: dateFormat),
            let expected2DaysBefore = FormatterUtils.dateFromString("01 Jul 2016", dateFormat: dateFormat),
            let expected7DaysBefore = FormatterUtils.dateFromString("26 Jun 2016", dateFormat: dateFormat),
            let expected30DaysBefore = FormatterUtils.dateFromString("03 Jun 2016", dateFormat: dateFormat)
            else { XCTFail(); return}
        //WHEN
        //THEN
        XCTAssertEqual(expected1DayBefore, date.dayBefore())
        XCTAssertEqual(expected2DaysBefore, date.daysBefore(2))
        XCTAssertEqual(expected7DaysBefore, date.daysBefore(7))
        XCTAssertEqual(expected30DaysBefore, date.daysBefore(30))
    }
    
    func testThisWeekForDate() {
        //GIVEN
        guard
            let dates: [Int: NSDate?] =
            [
                53: FormatterUtils.dateFromString("03 Jan 2016", dateFormat: dateFormat),
                5:  FormatterUtils.dateFromString("03 Feb 2016", dateFormat: dateFormat),
                9:  FormatterUtils.dateFromString("03 Mar 2016", dateFormat: dateFormat),
                13: FormatterUtils.dateFromString("03 Apr 2016", dateFormat: dateFormat),
                18: FormatterUtils.dateFromString("03 May 2016", dateFormat: dateFormat),
                22: FormatterUtils.dateFromString("03 Jun 2016", dateFormat: dateFormat),
                26: FormatterUtils.dateFromString("03 Jul 2016", dateFormat: dateFormat),
                31: FormatterUtils.dateFromString("03 Aug 2016", dateFormat: dateFormat),
                35: FormatterUtils.dateFromString("03 Sep 2016", dateFormat: dateFormat),
                40: FormatterUtils.dateFromString("03 Oct 2016", dateFormat: dateFormat),
                44: FormatterUtils.dateFromString("03 Nov 2016", dateFormat: dateFormat),
                48: FormatterUtils.dateFromString("03 Dec 2016", dateFormat: dateFormat),
                1:  FormatterUtils.dateFromString("03 Jan 2017", dateFormat: dateFormat)
            ]
            else { XCTFail(); return}
        //WHEN
        //THEN
        dates.forEach { (week: Int, date: NSDate?) in
            XCTAssertEqual(week, date?.weekNumber())
        }
    }
    
    func testPreviousWeeksForDate() {
        //GIVEN
        guard
            let date = FormatterUtils.dateFromString("03 Jul 2016", dateFormat: dateFormat),
            let expected1PreviousWeek = FormatterUtils.dateFromString("20 Jun 2016", dateFormat: dateFormat),
            let expected2PreviousWeeks = FormatterUtils.dateFromString("13 Jun 2016", dateFormat: dateFormat)
            else { XCTFail(); return}
        //WHEN
        //THEN
        XCTAssertEqual(expected1PreviousWeek, date.lastWeekStart())
        XCTAssertEqual(expected2PreviousWeeks, date.lastWeekStart()?.lastWeekStart())
    }
    
    func testNextWeeksForDate() {
        //GIVEN
        guard
            let date = FormatterUtils.dateFromString("03 Jul 2016", dateFormat: dateFormat),
            let expected1NextWeek = FormatterUtils.dateFromString("04 Jul 2016", dateFormat: dateFormat),
            let expected2NextWeeks = FormatterUtils.dateFromString("11 Jul 2016", dateFormat: dateFormat)
            else { XCTFail(); return}
        //WHEN
        //THEN
        XCTAssertEqual(expected1NextWeek, date.nextWeekStart())
        XCTAssertEqual(expected2NextWeeks, date.nextWeekStart()?.nextWeekStart())
    }
}
