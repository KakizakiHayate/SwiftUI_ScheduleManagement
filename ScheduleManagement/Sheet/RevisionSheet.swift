//
//  RevisionSheet.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/17.
//

import SwiftUI
import RealmSwift

struct RevisionSheet: View {
    @State private var showingAlertPlus = false
    @State private var showingAlertMinus = false
    @Binding var subjectArray: [String]
    @Binding var showRevisionSheet: Bool
    @Binding var date: Date
    @Binding var changeObjectInt: Int

    
    var dateFormatter: DateFormatter {
        let dateFomat = DateFormatter()
        dateFomat.dateStyle = .none
        dateFomat.timeStyle = .short
        dateFomat.locale = Locale(identifier: "ja_JP")
        return dateFomat
    }
    
    
    var body: some View {
        
        ScrollView {
            VStack {
                    Text("修正画面").font(.title2).bold().padding()
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        // changeObject関数から返ってきた値でdeleteAllScheduleGroup()する
                        changeObjectReset(changeObjectInt: changeObjectInt)
                        
                        subjectArray = ["","","","","",""]
                        date = Date()
                    }) {
                        Text("リセット").foregroundColor(Color.customColorPurple).padding(.trailing)
                    }
                }
                    
                
                ForEach(0 ..< subjectArray.count, id: \.self) { item in
                    HStack {
                        Text("\(item + 1)限目")
                            .font(.system(size: 15))
                            .foregroundColor(Color.customColorPurple)
                            .bold()
                            .padding(.bottom)
                            .padding(.leading)
                        
                        //このtext: は、Binding<String>になっているから入力させるなら今の状態ならOK
                        TextField("未入力", text: $subjectArray[item])
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.bottom)
                            .padding(.trailing)
                    }
                }
                
                HStack {
                    
                    Spacer()
                    //マイナスボタン
                    Button(action: {
                        //最低1まで来たら減らせない
                        if subjectArray.count == 1 {
                            showingAlertMinus = true
                        } else {
                            subjectArray.removeLast()
                        }
//                        //データベースの中身が空ならreturn。じゃないとcountScheduleGroup()で落ちる。
//                        //let firstObj = localRealm.objects(ScheduleGroup.self).first!←ココ
//                        guard let localRealm = try? Realm() else { return }
//                        let allObj = localRealm.objects(ScheduleGroup.self)
//                        if allObj.isEmpty { return }
//
//                        let scheduleGroup = ScheduleGroup()
//                        //ListとsubjectArrayの数を比較
//                        if scheduleGroup.countScheduleGroup() != subjectArray.count {
//                            //現在のデータベースを削除(Listが違う数でデータベースに保存できない)
//                            scheduleGroup.deleteAllScheduleGroup()
//                        }
                        
                        
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(Color.customColorPurple)
                            .bold()

                    }
                    .padding(.trailing).padding(.bottom)
                    .alert("お知らせ", isPresented: $showingAlertMinus) {
                        Button("OK") {}
                    } message: {
                        Text("これ以上削除できません")
                    }
                    //プラスボタン
                    Button(action: {
                        //最大10まで来たら増やせない
                        if subjectArray.count == 10 {
                            showingAlertPlus = true
                        } else {
                            subjectArray.append("")
                        }
                        
//                        guard let localRealm = try? Realm() else { return }
//                        let allObj = localRealm.objects(ScheduleGroup.self)
//                        if allObj.isEmpty { return }
//
//                        let scheduleGroup = ScheduleGroup()
//                        //ListとsubjectArrayの数を比較
//                        if scheduleGroup.countScheduleGroup() != subjectArray.count {
//                            //現在のデータベースを削除(Listが違う数でデータベースに保存できない)
//                            scheduleGroup.deleteAllScheduleGroup()
//                        }

                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Color.customColorPurple)
                            .bold()
                    }
                    .padding(.trailing).padding(.bottom)
                    .alert("お知らせ", isPresented: $showingAlertPlus) {
                        Button("OK") {}
                    } message: {
                        Text("これ以上増やせません")
                    }
                }
                
                Spacer()
                
                DatePicker("電車の時間", selection: $date, displayedComponents: .hourAndMinute)
                    .padding()
                
                Button(action: {
                    
                    //設定完了したらsheetを閉じる
                    showRevisionSheet = false
                    
                    changeObjectComplete(changeObjectInt: changeObjectInt)
//                    guard let localRealm = try? Realm() else { return }
//                    let allObj = localRealm.objects(ScheduleGroup.self)
//                    let scheduleGroup = ScheduleGroup()

//                    // データベースの中身が空か確認
//                    if allObj.isEmpty {
//                        //ScheduleGroupをaddする
//                        scheduleGroup.addScheduleGroup(subjectArray: subjectArray, date: date)
//                    } else if scheduleGroup.countScheduleGroup() != subjectArray.count {
//                    //もし、ListとsubjectArrayの中身の数が同じじゃないならdeleteしてaddする
//                        scheduleGroup.deleteAllScheduleGroup()
//                        scheduleGroup.addScheduleGroup(subjectArray: subjectArray, date: date)
//                    } else {
//                        //データベースの中身が空でもなくて、Listとsubjectの中身が同じ数じゃない場合
//                        scheduleGroup.updateScheduleGroup(subjectArray: subjectArray, date: date)
//                    }
                    
                    
                }) {
                    Text("変更完了")
                        .padding()
                        .background(Color.customColorPurple)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                
            }
        }
        
    }
    //リセットボタン
    //条件分岐させた後にデータベースをallDeleteする。
    func changeObjectReset(changeObjectInt: Int) {
        switch changeObjectInt {
            case 1:
                let monDayModel = MonDayModel()
                monDayModel.deleteAllMonDay()
            case 2:
                let tuesDayModel = TuesDayModel()
                tuesDayModel.deleteAllTuesDay()
            case 3:
                let wednesDayModel = WednesDayModel()
                wednesDayModel.deleteAllWednesDay()
            case 4:
                let thursDayModel = ThursDayModel()
                thursDayModel.deleteAllThursDay()
            case 5:
                let friDayModel = FriDayModel()
                friDayModel.deleteAllFriDay()
            case 6:
                let saturDayModel = SaturDayModel()
                saturDayModel.deleteAllSaturDay()
            case 7:
                let sunDayModel = SunDayModel()
                sunDayModel.deleteAllSunDay()
            default:
                return
        }
    }
    //設定完了ボタン
    func changeObjectComplete(changeObjectInt: Int) {
        switch changeObjectInt {
            case 1:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(MonDayModel.self)
                let monDayModel = MonDayModel()
                // データベースの中身が空か確認
                if allObj.isEmpty {
                    //ScheduleGroupをaddする
                    monDayModel.addMonDay(subjectArray: subjectArray, date: date)
                } else if monDayModel.countMonDayList() != subjectArray.count {
                //もし、ListとsubjectArrayの中身の数が同じじゃないならdeleteしてaddする
                    monDayModel.deleteAllMonDay()
                    monDayModel.addMonDay(subjectArray: subjectArray, date: date)
                } else {
                    //データベースの中身が空でもなくて、Listとsubjectの中身が同じ数じゃない場合
                    monDayModel.updateMonDay(subjectArray: subjectArray, date: date)
                }
                
            case 2:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(TuesDayModel.self)
                let tuesDayModel = TuesDayModel()
                
                if allObj.isEmpty {
                    
                    tuesDayModel.addTuesDay(subjectArray: subjectArray, date: date)
                } else if tuesDayModel.countTuesDayList() != subjectArray.count {
                
                    tuesDayModel.deleteAllTuesDay()
                    tuesDayModel.addTuesDay(subjectArray: subjectArray, date: date)
                } else {
                    
                    tuesDayModel.updateTuesDay(subjectArray: subjectArray, date: date)
                }
            case 3:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(WednesDayModel.self)
                let wednesDayModel = WednesDayModel()
                
                if allObj.isEmpty {
                    
                    wednesDayModel.addWednesDay(subjectArray: subjectArray, date: date)
                } else if wednesDayModel.countWednesDayList() != subjectArray.count {
                
                    wednesDayModel.deleteAllWednesDay()
                    wednesDayModel.addWednesDay(subjectArray: subjectArray, date: date)
                } else {
                    
                    wednesDayModel.updateWednesDay(subjectArray: subjectArray, date: date)
                }
            case 4:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(ThursDayModel.self)
                let thursDayModel = ThursDayModel()
                
                if allObj.isEmpty {
                    
                    thursDayModel.addThursDay(subjectArray: subjectArray, date: date)
                } else if thursDayModel.countThursDayList() != subjectArray.count {
                
                    thursDayModel.deleteAllThursDay()
                    thursDayModel.addThursDay(subjectArray: subjectArray, date: date)
                } else {
                    
                    thursDayModel.updateThursDay(subjectArray: subjectArray, date: date)
                }
            case 5:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(FriDayModel.self)
                let friDayModel = FriDayModel()
                
                if allObj.isEmpty {
                    
                    friDayModel.addFriDay(subjectArray: subjectArray, date: date)
                } else if friDayModel.countFriDayList() != subjectArray.count {
                
                    friDayModel.deleteAllFriDay()
                    friDayModel.addFriDay(subjectArray: subjectArray, date: date)
                } else {
                    
                    friDayModel.updateFriDay(subjectArray: subjectArray, date: date)
                }
            case 6:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(SaturDayModel.self)
                let saturDayModel = SaturDayModel()
                
                if allObj.isEmpty {
                    
                    saturDayModel.addSaturDay(subjectArray: subjectArray, date: date)
                } else if saturDayModel.countSaturDayList() != subjectArray.count {
                
                    saturDayModel.deleteAllSaturDay()
                    saturDayModel.addSaturDay(subjectArray: subjectArray, date: date)
                } else {
                    
                    saturDayModel.updateSaturDay(subjectArray: subjectArray, date: date)
                }
            case 7:
                guard let localRealm = try? Realm() else { return }
                let allObj = localRealm.objects(SunDayModel.self)
                let sunDayModel = SunDayModel()
                
                if allObj.isEmpty {
                    
                    sunDayModel.addSunDay(subjectArray: subjectArray, date: date)
                } else if sunDayModel.countSunDayList() != subjectArray.count {
                
                    sunDayModel.deleteAllSunDay()
                    sunDayModel.addSunDay(subjectArray: subjectArray, date: date)
                } else {
                    
                    sunDayModel.updateSunDay(subjectArray: subjectArray, date: date)
                }
            default:
                return
                            
        }
    }
}

struct RevisionSheet_Previews: PreviewProvider {
    static var previews: some View {
        RevisionSheet(subjectArray: .constant(["","","","","",""]), showRevisionSheet: .constant(false), date: .constant(Date()), changeObjectInt: .constant(0))
            .environmentObject(Migration())
    }
}
