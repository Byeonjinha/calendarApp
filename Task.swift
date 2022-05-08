//
//  Task.swift
//  watercalendar
//
//  Created by Hyeongjung on 2022/05/03.
//

import SwiftUI

// Task Model and Sample Tasks...
// Array of Tasks...
struct Task: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Total Task Meta View...
struct TaskMetaData: Identifiable{
    var id = UUID().uuidString
    var task: [Task]
    var taskDate: Date
    var taskTime : String
}

// samplre Date for Testing...
// 여기서는 offset을 기준으로 알림날짜를 선택한다
// 나는 처음부터 날짜를 저장하여 경고횟수를 띄우고 싶다.
func getSampleDate(offset: Int)->Date{
    
    let calender = Calendar.current
    
    let date = calender.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

func getSampleDate(dateString:String)->Date{
    
    let dateFormatter = DateFormatter()

    dateFormatter.dateFormat = "yyyy-MM-dd"
    dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?

    let date:Date = dateFormatter.date(from: dateString)!
    
    return date ?? Date() //빈값이 안오면 왼쪽 빈값이 오면 default 데이터인 오른쪽을 보낸다.
}


// Sample Tasks...

