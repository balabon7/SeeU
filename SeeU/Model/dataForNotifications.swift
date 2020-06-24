//
//  dataForNotifications.swift
//  iSeeYouAgainApp
//
//  Created by mac on 10.08.2019.
//  Copyright © 2019 sashabalabon. All rights reserved.
//

import Foundation

struct DataForNotivication {
    
    let timeToActive: String
    let dateValue: DateComponents
    let id: String
}

let dateOne =   DataForNotivication(timeToActive: "07:00", dateValue: DateComponents( hour: 07 , minute: 00), id: "FirstLocalNotification")
let dateTwo =   DataForNotivication(timeToActive: "09:30", dateValue: DateComponents( hour: 09 , minute: 30), id: "SecondLocalNotification")
let dateThree = DataForNotivication(timeToActive: "13:30", dateValue: DateComponents( hour: 13 , minute: 30), id: "ThirdLocalNotification")
let dateFour =  DataForNotivication(timeToActive: "17:00", dateValue: DateComponents( hour: 17 , minute: 00), id: "FourthLocalNotification")
let dateFive =  DataForNotivication(timeToActive: "20:30", dateValue: DateComponents( hour: 20 , minute: 30), id: "FifthLocalNotification")

