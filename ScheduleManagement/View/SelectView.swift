//
//  SelectView.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/16.
//

import SwiftUI

struct SelectView: View {
    @EnvironmentObject var migration: Migration
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.customColorPurple, .white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack{
                    HStack {
                        
                        VStack {
                            NavigationLink {
                                SaturdayView(saturDayModel: SaturDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("土")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }.padding(.bottom)
                            
                            NavigationLink {
                                SundayView(sunDayModel: SunDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("日")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }.padding(.top)
                        }.padding(.trailing)
                        
                        VStack {
                            NavigationLink {
                                WednesdayView(wednesDayModel: WednesDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("水")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }.padding(.bottom)
                            
                            NavigationLink {
                                ThursdayView(thursDayModel: ThursDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("木")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }
                            
                            NavigationLink {
                                FridayView(friDayModel: FriDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("金")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }.padding(.top)
                        }
                        
                        VStack {
                            NavigationLink {
                                MondayView(mondayModel: MonDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("月")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }.padding(.bottom)
                            
                            NavigationLink {
                                TuesdayView(tuesDayModel: TuesDayModel(), migration: Migration())
                                    .environmentObject(Migration())
                                
                            } label: {
                                Text("火")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .frame(width: 65, height: 65)
                                    .background(Color.customColorPurple)
                                    .cornerRadius(40)
                            }.padding(.top)
                        }.padding(.leading)
                       
                    }
                }
            }
            }
            
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
            .environmentObject(Migration())
        
    }
}
