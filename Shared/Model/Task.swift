////
////  Task.swift
////  badgerHouse (iOS)
////
////  Created by Byeon jinha on 2022/05/03.
////
//
//import SwiftUI
//struct Task: Identifiable{
//// Task Model and Sample Task...
//var id = UUID().uuidString
//var title: String
//var time: Date = Date()
//}
//
//struct TaskMetaData : Identifiable {
//    var id = UUID().uuidString
//    var task : [Task]
//    var taskDate : Date
//}
//
//// sample Fate for Testing...
//func getSampleDate(offset: Int)->Date{
//    let calender = Calendar.current
//    let date = calender.date(byAdding: .day, value: offset, to: Date())
//    
//    return date ?? Date()
//}
//
//// Sample Tasks...
//var tasks : [TaskMetaData] = [
//    TaskMetaData(task: [
//        Task(title: "Talk to iJustine"),
//        Task(title: "iPhone 13 Great Design Change"),
//        Task(title: "Nothing Much Workout!!")
//    ], taskDate: getSampleDate(offset: 1)),
//    TaskMetaData(task: [
//        
//        Task(title: "Talk to Jenna Ezarik")
//    ], taskDate: getSampleDate(offset: -3)),
//    TaskMetaData(task: [
//        
//        Task(title: "Meeting with Time Cook")
//    ], taskDate: getSampleDate(offset:  -8)),
//    TaskMetaData(task: [
//     
//        Task(title: "Next Version of SwiftUI")
//    ], taskDate: getSampleDate(offset: 10)),
//    TaskMetaData(task:[
//        
//        Task(title: "Next Version of SwiftUI")
//    ], taskDate: getSampleDate(offset: -22)),
//    TaskMetaData(task:[
//        Task(title: "")
//    ], taskDate: getSampleDate(offset: 15)),
//    TaskMetaData(task:[
//        Task(title: "Kavsoft App Updates....")
//    ], taskDate: getSampleDate(offset: -20)),
//    TaskMetaData(task:[
//        
//        
//    ])
//]
