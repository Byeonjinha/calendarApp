//
//  CustomDatePicker.swift
//  watercalendar
//
//  Created by Hyeongjung on 2022/05/03.
//
import SwiftUI
struct CustomDatePicker: View {
    @Binding var isOn : Bool
    @Binding var tasks : [TaskMetaData] 
    @Binding var content : String
    @Binding var currentDate : Date
    @Binding var reservationPageOn : Bool
    @Binding var deleteOn : Bool
    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0
    var body: some View {
        VStack(spacing:35){
            let days: [String] = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10){
                    Text(extraDate()[0])
                        .font(Font.custom("BMHANNAPro", size: 15, relativeTo: .title))
                        .fontWeight(.semibold)
                    Text(extraDate()[1])
                        .font(Font.custom("BMHANNAPro", size: 40, relativeTo: .title))
                }
                Spacer(minLength:0)
                Button{
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                Button{
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }.padding(.horizontal)
            HStack(spacing: 0){
                ForEach(days,id: \.self){day in
                    if day=="Sun"{
                        Text(day)
                            .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.red)
                    }
                    else if day=="Sat"{
                        Text(day)
                            .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.blue)
                    }
                    else{
                    Text(day)
                            .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 15){
            
                ForEach(extractDate()){value in
                    
                    CardView(value: value)
                        .background(
                            //날짜클릭 시 백그라운드 색
                            Circle()
                                .offset(y:-20)
                                .fill(.blue)
                                .padding(.horizontal,8)
                                .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                        ) .onTapGesture(count: 2){
                            currentDate = value.date
                            if tasks.count == 0 {
                                withAnimation{
                                    content = ""
                                    reservationPageOn.toggle()
                                }
                            }
                            else{
                                for i in 0...tasks.count-1{
                                    if tasks[i].taskDate == currentDate+32400 {
                                        isOn = true
                                    }
                                }
                                if !isOn{
                                    content = ""
                                    reservationPageOn.toggle()
                                }
                            }
                           
                        }
                        .alert(isPresented: $isOn) {
                                    Alert(title: Text("코딩이나 하세요."), message: Text("이미 약속이 잡혀있습니다."), dismissButton: .default(Text("반성하러 가기")))
                                }
                        .onTapGesture {
                            if !reservationPageOn{
                                currentDate = value.date
                            }
                        }
                }
            }
            VStack(spacing: 20){
                Text("일정")
                    .font(Font.custom("BMHANNAPro", size: 25, relativeTo: .title))
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                if let task = tasks.first(where: { task in
                    return isSameDay(date1: task.taskDate, date2: currentDate)
                }){
                    ForEach(tasks){task in
                        if (task.taskDate-32400) == currentDate {
                        ZStack(alignment: .trailing){
                            VStack(alignment: .leading, spacing: 10){
                                Text( task.taskTime )
                                Text(task.task[0].title)
                                    .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                            }
                            .padding(.vertical,10)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .background(
                                Color(.white)
                                    .opacity(0.5)
                                    .border(.black)
                            )
                            Button(action: {
                                for i in 0...tasks.count-1{
                                    if tasks[i].taskDate == currentDate+32400 {
                                        tasks   .remove(at: i)
                                        break
                                    }
                                }
                            }){Image(systemName: "x.circle").resizable().frame(width: 30, height: 25).padding(10).foregroundColor(.black)
                            }
                        }
                        }
                    }
                }
                else{
                    Text("일정이 없습니다. :)") .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                }
            }
            .padding()
        }
        .onChange(of: currentMonth){ newValue in
            //updating Month...
            currentDate = getCurrentMonth()
        }
    }
    @ViewBuilder
    func CardView(value: DateValue)->some View{
        VStack{
            if value.day != -1{
                //closer
                if let task = tasks.first(where: { task in
                    
                    return isSameDay(date1: task.taskDate, date2: value.date)
                }){
                    Circle().frame(width: 35).overlay(
                    Text("\(value.day)")
                        .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                        .foregroundColor(isSameDay(date1: task.taskDate, date2: currentDate) ?
                            .white : .primary)
                        .frame(maxWidth: .infinity)
                    ).foregroundColor(.mint)
                        .offset(y:-12)
                    Spacer()
                    
                    Circle()
                        .fill(.orange)
//                        .fill(isSameDay(date1: task.taskDate, date2: currentDate) ? .white : Color("blue"))
                        .frame(width: 8, height: 8)
                        .offset(y:-20)
                }
                else{
                    
                    Text("\(value.day)")
                        .font(Font.custom("BMHANNAPro", size: 20, relativeTo: .title))
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ?
                            .white : .primary)
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
            }
        }

        .frame(height: 60,alignment: .top)
    }
    func isSameDay(date1: Date,date2: Date)->Bool{
        let calendar = Calendar.current
        return calendar.isDate(date1, inSameDayAs: date2)
    }
    func extraDate()->[String]{
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    func getCurrentMonth()->Date{
        let calendar  = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date())
        else{
            return Date()
        }
        return currentMonth
    }
    func extractDate()->[DateValue]{
        let calendar  = Calendar.current
        let currentMonth = getCurrentMonth()
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        for _ in 0..<firstWeekday - 1{
            days.insert(DateValue(day: -1, date: Date()), at:0)
        }
        return days
    }
}
struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension Date{
    func getAllDates()->[Date]{
        let calendar = Calendar.current
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year,.month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        return range.compactMap{ day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}

