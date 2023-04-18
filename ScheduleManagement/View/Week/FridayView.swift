//
//  FridayView.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/16.
//

import SwiftUI
import RealmSwift

struct FridayView: View {
    @State var subjectArray:[String] = []
    @State private var subjectCount = 0
    @State private var showRevisionSheet = false
    @State private var date = Date()
    @State private var nextMigration: UInt64 = 2
    @State var changeObjectInt = 5
    @ObservedResults(FriDayModel.self) var friDayModel
    @EnvironmentObject var migration: Migration
    
    var dateFormatter: DateFormatter {
        let dateFomat = DateFormatter()
        dateFomat.dateStyle = .none
        dateFomat.timeStyle = .short
        dateFomat.locale = Locale(identifier: "ja_JP")
        return dateFomat
    }
    
    init(friDayModel: FriDayModel, migration: Migration) {
        let config = Realm.Configuration(schemaVersion: migration.nextMigration)
        Realm.Configuration.defaultConfiguration = config
    }
    
    var body: some View {
        VStack {
            NavigationStack{
                ZStack(alignment: .bottomTrailing) {
                    List {
                        Section {
                            //保存されたListを表示する。subjectArrayにListを代入している。
                            ForEach(0 ..< subjectArray.count, id: \.self) { subject in
                                VStack {
                                    //+1すると\(subject + 1)が1始まりになる。
                                    HStack {
                                        Text("\(subject + 1)： ")
                                            .foregroundColor(Color.customColorPurple).bold()
                                        Text("\(subjectArray[subject])")
                                    }
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
                                //dateを表示させる。
                                if friDayModel.isEmpty {
                                    Text("電車の時刻が未設定です")
                                } else {
                                    Text("\(dateFormatter.string(from: date))の電車です")
                                }
                                
                            }
                        } header: {
                            Text("電車の時刻")
                        }
                    }.navigationTitle("金曜日")
                    
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
                        //subjectArrayは、TextFieldのtext:の型がBinding<String>だから渡す必要がある
                        RevisionSheet(subjectArray: $subjectArray, showRevisionSheet: $showRevisionSheet, date: $date, changeObjectInt: $changeObjectInt)
                    }
                }
            }
            
        }
        .onAppear {
            guard let localRealm = try? Realm() else { return }
            let allObj = localRealm.objects(FriDayModel.self)
            
            //データベースに値が入っているなら保存されたデータをself.変数に代入、空なら初期値を代入
            if allObj.isEmpty {
                self.subjectArray = ["","","","","",""]
                self.date = Date()
            } else {
                //ListのデータをsubjectArrayに代入する。
                //subjectArrayは、TextFieldのtext:の型がBinding<String>だから代入する必要がある。
                if let schedule = friDayModel.first {
                    for list in schedule.friDayList {
                        subjectArray.append(list)
                    }
                }
                
                //保存されたdateをself.dateに代入
                let objFirst = localRealm.objects(FriDayModel.self).first!
                self.date = objFirst.date
            }
        }
    }
}

struct FridayView_Previews: PreviewProvider {
    static var previews: some View {
        FridayView(friDayModel: FriDayModel(), migration: Migration()).environmentObject(Migration())
    }
}
