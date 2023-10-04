//
//  Date+Ext.swift
//  Appetizers
//
//  Created by yeolife on 10/5/23.
//

import Foundation

// DatePicker의 Date 최소 - 최대 날짜를 지정
extension Date {
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
}
