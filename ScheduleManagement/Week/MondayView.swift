//
//  MondayView.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/16.
//

import SwiftUI

struct MondayView: View {
    
    @State var subjectArray = ["", "" , "", "", "", ""]
    @State private var subjectCount = 0
    @State private var showRevisionSheet = false
    @State private var firstPeriod = ""
    @State private var date = Date()
    @ObservedObject var revisionModel = RevisionModel()
    
    var dateFormatter: DateFormatter {
        let dateFomat = DateFormatter()
        dateFomat.dateStyle = .none
        dateFomat.timeStyle = .short
        dateFomat.locale = Locale(identifier: "ja_JP")
        return dateFomat
    }
    
    var body: some View {
        VStack {
            NavigationStack{
                ZStack(alignment: .bottomTrailing) {
                    List {
                        Section {
                            ForEach(0 ..< subjectArray.count, id: \.self)  { subject in
                                VStack {
                                    //+1すると1始まりになる。
                                    Text("\(subject + 1)： \(subjectArray[subject])")
                                }
                            }
                        } header: {
                            Text("時間割")
                        }
                        
                        Section {
                            HStack {
                                Image(systemName: "train.side.front.car")
                                    .foregroundColor(Color.customColorPurple)
                                    .font(.system(size: 30.0))
                                Text("\(dateFormatter.string(from: date))の電車です")
                            }
                        } header: {
                            Text("電車の時刻")
                        }
                    }.navigationTitle("月曜日")
                    
                    Button(action: {
                        showRevisionSheet = true
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                        
                    }
                    .frame(width: 70, height: 70)
                    .background(Color.customColorPurple)
                    .cornerRadius(40.0)
                    .padding(.bottom)
                    .padding(.trailing)
                    .sheet(isPresented: $showRevisionSheet) {
                        RevisionSheet(subjectArray: $subjectArray, showRevisionSheet: $showRevisionSheet, date: $date)
                    }
                }
            }
            
        }
    }//body
}//View

struct MondayView_Previews: PreviewProvider {
    static var previews: some View {
        MondayView()
    }
}
