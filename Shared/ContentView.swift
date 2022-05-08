//
//  ContentView.swift
//  watercalendar
//
//  Created by Hyeongjung on 2022/05/02.
//

import SwiftUI

struct ContentView: View {
    @State private var date = Date()
    var body: some View {
        DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            )
            .datePickerStyle(.graphical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
