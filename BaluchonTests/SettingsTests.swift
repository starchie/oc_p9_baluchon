//
//  SettingsTests.swift
//  BaluchonTests
//
//  Created by Gilles Sagot on 21/07/2021.
//

import XCTest

@testable import Baluchon

class SettingsTests: XCTestCase {
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCurrentLanguage_WhenChangeLanguage_ThenCurrentLanguageShouldUpdate() {
        Settings.shared.changeLanguage(with: .en)
        XCTAssert(Settings.shared.currentLanguage == "en")
    }
    
    
    func testSaveWeatherDataWhenGetWeatherThenDataShouldBeSavedinArrayAtIndexOne(){
        let weatherData = WeatherResult(weather: [Weather(description: "légère pluie", icon: "10d")], main: Main(temp: 293.09, humidity: 79), name: "Paris")
        Settings.shared.saveWeathersLastIndex(from: weatherData)
        XCTAssert(Settings.shared.weathers[1].main.humidity == 79)
        
        
    }
    
    func testSaveWeatherDataWhenGetWeatherThenDataShouldBeSavedinArrayAtIndexZero(){
        let weatherData = WeatherResult(weather: [Weather(description: "légère pluie", icon: "10d")], main: Main(temp: 293.09, humidity: 79), name: "Paris")
        Settings.shared.saveWeathersFirstIndex(from: weatherData)
        XCTAssert(Settings.shared.weathers[0].main.humidity == 79)
        
        
    }
    
    

}