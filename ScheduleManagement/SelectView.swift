//
//  SelectView.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/16.
//

import SwiftUI

struct SelectView: View {
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink {
                    MondayView()
                } label: {
                    Text("月曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink {
                    TuesdayView()
                } label: {
                    Text("火曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink {
                    WednesdayView()
                } label: {
                    Text("水曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink {
                    ThursdayView()
                } label: {
                    Text("木曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink {
                    FridayView()
                } label: {
                    Text("金曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink {
                    SaturdayView()
                } label: {
                    Text("土曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                
                NavigationLink {
                    SundayView()
                } label: {
                    Text("日曜日")
                        .frame(width: 200)
                        .font(.title)
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }.padding()
                    
                
            }
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
