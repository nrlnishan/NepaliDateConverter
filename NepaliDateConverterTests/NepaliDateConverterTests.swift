//
//  NepaliDateConverterTests.swift
//  NepaliDateConverterTests
//
//  Created by Nishan Niraula on 4/9/19.
//  Copyright © 2019 Nishan Niraula. All rights reserved.
//

import XCTest
@testable import NepaliDateConverter

class NepaliDateConverterTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        
    }
    
    func testNepaliDigitsTranslation() {
        
        let digit1 = 15
        let digit2 = 67
        
        let translator = NepaliDateTranslator()
        
        let nepaliDigit1 = translator.getNumber(number: digit1)
        XCTAssert(nepaliDigit1 == "१५")
        
        let nepaliDigit2 = translator.getNumber(number: digit2)
        XCTAssert(nepaliDigit2 == "६७")
    }
    
    func testNepaliMonthsTranslation() {
        
        let month1 = 1 // baisakh
        let month2 = 11 // Falgun
        
        let translator = NepaliDateTranslator()
        
        let nepaliMonth1 = translator.getMonth(month: month1)
        XCTAssert(nepaliMonth1 == "बैशाख")
        
        let nepaliMonth2 = translator.getMonth(month: month2)
        XCTAssert(nepaliMonth2 == "फाल्गुन")
    }
    
    func testNepaliDaysTranslation() {
        
        let day1 = 1 // Sunday
        let day4 = 4 // Wednesday
        
        let translator = NepaliDateTranslator()
        
        let nepaliDay1 = translator.getDay(day: day1)
        XCTAssert(nepaliDay1 == "आईत")
        
        let nepaliDay2 = translator.getDay(day: day4)
        XCTAssert(nepaliDay2 == "बुध")
    }
    
    // MARK:- Date Conversion
    
    func testEnglishToNepaliDateConversion() {
        
        let converter = DateConverter()
        
        // 1. English date one day less than valid range
        let nepDate1 = converter.getNepaliDate(englishDate: DateModel(year: 1943, month: 04, day: 13))
        XCTAssertNil(nepDate1)
        
        // 2. English date one month less than valid range
        let nepDate2 = converter.getNepaliDate(englishDate: DateModel(year: 1943, month: 03, day: 14))
        XCTAssertNil(nepDate2)
        
        // 3. English date one year less than valid range
        let nepDate3 = converter.getNepaliDate(englishDate: DateModel(year: 1942, month: 04, day: 14))
        XCTAssertNil(nepDate3)
        
        
        // 4. English date one day grater than valid range
        let nepDate4 = converter.getNepaliDate(englishDate: DateModel(year: 2034, month: 04, day: 14))
        XCTAssertNil(nepDate4)
        
        // 5. English date one month greater than valid range
        let nepDate5 = converter.getNepaliDate(englishDate: DateModel(year: 2034, month: 05, day: 13))
        XCTAssertNil(nepDate5)
        
        // 6. English date one year greater than valid range
        let nepDate6 = converter.getNepaliDate(englishDate: DateModel(year: 2035, month: 04, day: 13))
        XCTAssertNil(nepDate6)
        
        // 7. English date within valid range
        let nepDate7 = converter.getNepaliDate(englishDate: DateModel(year: 2019, month: 04, day: 10))
        
        XCTAssertNotNil(nepDate7)
        XCTAssert(nepDate7!.year == 2075 && nepDate7!.month == 12 && nepDate7!.day == 27)
        
        // 8. Invalid date, Feb having 31 days
        let nepDate8 = converter.getNepaliDate(englishDate: DateModel(year: 2019, month: 02, day: 31))
        XCTAssertNil(nepDate8)
        
        let nepDate9 = converter.getNepaliDate(englishDate: DateModel(year: 2019, month: 13, day: 12))
        XCTAssertNil(nepDate9)
        
    }
    
    func testNepaliToEnglishDateConversion() {
        
        let converter = DateConverter()
        
        // 1. Nepali date is less than valid range
        let engDate1 = converter.getEnglishDate(nepaliDate: DateModel(year: 1999, month: 12, day: 30))
        XCTAssertNil(engDate1)
        
        // 2. Nepali date is greater than valid range
        let engDate2 = converter.getEnglishDate(nepaliDate: DateModel(year: 2091, month: 01, day: 01))
        XCTAssertNil(engDate2)
        
        // 3. Invalid date, Month greater than 12
        let engDate3 = converter.getEnglishDate(nepaliDate: DateModel(year: 2075, month: 13, day: 27))
        XCTAssertNil(engDate3)
        
        // 4. Invalid date, 2075 Chaitra dont have 31 days
        let engDate4 = converter.getEnglishDate(nepaliDate: DateModel(year: 2075, month: 12, day: 31))
        XCTAssertNil(engDate4)
        
        // 5. Correct Date
        let engDate5 = converter.getEnglishDate(nepaliDate: DateModel(year: 2075, month: 12, day: 27))
        XCTAssert(engDate5!.year == 2019 && engDate5!.month == 04 && engDate5!.day == 10)
        
        let engDate6 = converter.getEnglishDate(nepaliDate: DateModel(year: 2050, month: 03, day: 17))
        XCTAssert(engDate6!.year == 1993 && engDate6!.month == 07 && engDate6!.day == 01)
    }
    
    
}
