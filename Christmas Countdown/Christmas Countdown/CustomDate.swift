//
//  CustomDate.swift
//  Christmas Countdown
//
//  Created by SaulUrias on 07/07/20.
//  Copyright © 2020 SaulUrias. All rights reserved.
//

import Foundation

struct CustomDate {
    static var christmas: Date {
        var dateComponents = DateComponents()
        let calendar = Calendar.current
        dateComponents.year = calendar.component(.year, from: Date())
        dateComponents.month = 12
        dateComponents.day = 25
        guard let date = calendar.date(from: dateComponents) else {
            fatalError("Unable to get Christmas Date")
        }
        return date
    }
}
