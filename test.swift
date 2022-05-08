//
//  test.swift
//  watercalendar
//
//  Created by Hyeongjung on 2022/05/03.
//

import SwiftUI

struct test: View {
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("2021")
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text("september")
                        .font(.title.bold())
                    
                 
                }
                
                Spacer(minLength: 0)
                
                Button{
                    
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button{
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
        }
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
