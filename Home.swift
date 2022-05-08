//
//  Home.swift
//  watercalendar
//
//  Created by Hyeongjung on 2022/05/03.
//

import SwiftUI

struct Home: View {
    @State var tasks: [TaskMetaData] = [
    ]
    @State var deleteOn : Bool = false
    @State var isOn : Bool = false
    @State var currentDate: Date = Date()
    @State var reservationPageOn : Bool = false
    @State private var wakeUp = Date()
    @State var content : String = ""
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                ZStack{
                    // Custom Date Picker....
                    CustomDatePicker(isOn: $isOn, tasks: $tasks, content: $content, currentDate :  $currentDate , reservationPageOn: $reservationPageOn, deleteOn: $deleteOn)
                    if reservationPageOn {
                        ZStack{
                        Rectangle()
                                .frame(width:305, height: 405)
                                .foregroundColor(.white)
                                .border(.black)
                                .overlay(  Rectangle()  .frame(width:300, height: 400)
                                    .foregroundColor(.gray)
                                    .opacity(0.1)
                                    .border(.black))
                        Button(action:{
                            reservationPageOn.toggle()
                        })
                        {
                            Image(systemName: "x.circle").resizable()
                                .frame(width: 30, height: 30, alignment: .topTrailing).padding(10).foregroundColor(.black)
                        }
                    
                        .offset(x:120,y:-170) //버튼
                        
                        DatePicker("meat", selection: $wakeUp,
                                   displayedComponents: .hourAndMinute)
                        .frame(width: 200, height: 200)
                        .datePickerStyle(WheelDatePickerStyle()).labelsHidden().offset(y:-40) //데이트 피커
                        
                        TextField("약속 내용",text:$content){
                        }.padding(5).border(.black).frame(width: 200, height: 200).offset(y:80)
                        
                        Button(action:{
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "yyyy-MM-dd"
                            let dateString:String = dateFormatter.string(from: currentDate)
                            
                            let dateFormatter2 = DateFormatter()
                            dateFormatter2.dateFormat = "HH:mm"
                            let dateString2 :String = dateFormatter2.string(from: wakeUp)
                            print(dateString2)
                            tasks.append(TaskMetaData(task: [   Task(title: content),], taskDate: getSampleDate(dateString: dateString) ,taskTime: dateString2  )  )
                       
//                            withAnimation{
                                reservationPageOn.toggle()
//                            }
                        })
                        {
                            Rectangle()
                                .foregroundColor(.white)
                                .frame(width: 100, height: 50, alignment: .center)
                                .border(.black)
                                .overlay(
                                    Rectangle()
                                        .foregroundColor(.white)
                                        .frame(width: 95, height: 45, alignment: .center)
                                        .border(.black))
                                .overlay(Text("약속 잡기").foregroundColor(.black)
                                    .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                                )
                        }
                        .offset(y:140)  // 버튼
                        }
                        .transition(.asymmetric(insertion: AnyTransition.move(edge: .bottom),
                                                removal: AnyTransition.move(edge: .bottom))
                        )
                        
                    }
                } //ZStack
            } //VStack
            .padding(.vertical)
            
        } //ScrollView
        .navigationBarTitleDisplayMode(.inline)
    } //body
} //View

