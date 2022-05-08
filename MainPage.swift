//
//  MainPage.swift
//  badgerHouse (iOS)
//
//  Created by Byeon jinha on 2022/05/04.
//

import SwiftUI

struct MainPage: View {
    var body: some View {
        NavigationView{
            VStack{
                
                Text("BadgerHouse") .font(Font.custom("BMHANNAPro", size: 50, relativeTo: .title))
                Spacer().frame(height: 50)
            
                Image("badgerImage").resizable().frame(width: 300, height: 200, alignment: .center).cornerRadius(20)
                Spacer().frame(height: 40)
            
                NavigationLink(destination: Home()){
                    Rectangle().frame(width: 200, height: 50, alignment: .center).foregroundColor(.white).border(.black).overlay(
                    Rectangle().frame(width: 195, height: 45, alignment: .center).foregroundColor(.white).border(.black)).overlay(Text("일정 관리").font(Font.custom("BMHANNAPro", size: 30, relativeTo: .title)).foregroundColor(.black))
                }
                Spacer().frame(height: 20)
                NavigationLink(destination: Home2()){
                    Rectangle().frame(width: 200, height: 50, alignment: .center).foregroundColor(.white).border(.black).overlay(
                    Rectangle().frame(width: 195, height: 45, alignment: .center).foregroundColor(.white).border(.black)).overlay(Text("추억 :)").font(Font.custom("BMHANNAPro", size: 30, relativeTo: .title)).foregroundColor(.black))
                }
                Spacer()
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
