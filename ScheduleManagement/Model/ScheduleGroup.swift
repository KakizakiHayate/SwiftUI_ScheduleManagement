//
//  ScheduleModel.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/03/06.
//

import Foundation
import RealmSwift

//class ScheduleGroup: Object, ObjectKeyIdentifiable{
//    @Persisted(primaryKey: true) var _id: ObjectId
//    @Persisted var scheduleLists = List<String>()
//    @Persisted var date: Date
//}
//
//extension ScheduleGroup {
//
//    //保存
//    func addScheduleGroup(subjectArray: [String], date: Date) {
//
//        let scheduleGroup = ScheduleGroup()
//
//        // subjectArrayをListの中に一つ一つappendしていく
//        for subject in subjectArray {
//            scheduleGroup.scheduleLists.append(subject)
//        }
//
//        //dateを追加
//        scheduleGroup.date = date
//
//        //add実行
//        guard let localRealm = try? Realm() else { return }
//        try? localRealm.write {
//            localRealm.add(scheduleGroup)
//        }
//    }
//    //更新
//    func updateScheduleGroup(subjectArray: [String], date: Date) {
//        guard let localRealm = try? Realm() else { return }
//        let firstObj = localRealm.objects(ScheduleGroup.self).first!
//        try? localRealm.write {
//            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
//            for subject in 0 ..< subjectArray.count {
//                firstObj.scheduleLists[subject] = subjectArray[subject]
//            }
//
//            //date更新
//            firstObj.date = date
//        }
//    }
//
//    func countScheduleGroup() -> Int {
//        guard let localRealm = try? Realm() else { return 0 }
//        let firstObj = localRealm.objects(ScheduleGroup.self).first!
//        return firstObj.scheduleLists.count
//    }
//
//    //全削除(リセット)
//    func deleteAllScheduleGroup() {
//        guard let localRealm = try? Realm() else { return }
//        let allObj = localRealm.objects(ScheduleGroup.self)
//        try? localRealm.write {
//            localRealm.delete(allObj)
//        }
//    }
//}

// 月曜日
class MonDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var monDayList = List<String>()
    @Persisted var date: Date
}
extension MonDayModel {
    //保存
    func addMonDay(subjectArray: [String], date: Date) {
        
        let monDayModel = MonDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            monDayModel.monDayList.append(subject)
        }
        
        //dateを追加
        monDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(monDayModel)
        }
    }
    //更新
    func updateMonDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(MonDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.monDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    //Listの中身の数を返す
    func countMonDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(MonDayModel.self).first!
        return firstObj.monDayList.count
    }
    
    //全削除(リセット)
    func deleteAllMonDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(MonDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}



//火曜日
class TuesDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var tuesDayList = List<String>()
    @Persisted var date: Date
}

extension TuesDayModel {
    //保存
    func addTuesDay(subjectArray: [String], date: Date) {
        
        let tuesDayModel = TuesDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            tuesDayModel.tuesDayList.append(subject)
        }
        
        //dateを追加
        tuesDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(tuesDayModel)
        }
    }
    //更新
    func updateTuesDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(TuesDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.tuesDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    
    func countTuesDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(TuesDayModel.self).first!
        return firstObj.tuesDayList.count
    }
    
    //全削除(リセット)
    func deleteAllTuesDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(TuesDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}

//水曜日
class WednesDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var wednesDayList = List<String>()
    @Persisted var date: Date
}

extension WednesDayModel {
    //保存
    func addWednesDay(subjectArray: [String], date: Date) {
        
        let wednesDayModel = WednesDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            wednesDayModel.wednesDayList.append(subject)
        }
        
        //dateを追加
        wednesDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(wednesDayModel)
        }
    }
    //更新
    func updateWednesDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(WednesDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.wednesDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    
    func countWednesDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(WednesDayModel.self).first!
        return firstObj.wednesDayList.count
    }
    
    //全削除(リセット)
    func deleteAllWednesDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(WednesDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}

//木曜日
class ThursDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var thursDayList = List<String>()
    @Persisted var date: Date
}
extension ThursDayModel {
    //保存
    func addThursDay(subjectArray: [String], date: Date) {
        
        let thursDayModel = ThursDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            thursDayModel.thursDayList.append(subject)
        }
        
        //dateを追加
        thursDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(thursDayModel)
        }
    }
    //更新
    func updateThursDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(ThursDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.thursDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    //Listの中身の数を返す
    func countThursDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(ThursDayModel.self).first!
        return firstObj.thursDayList.count
    }
    
    //全削除(リセット)
    func deleteAllThursDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(ThursDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}


//金曜日
class FriDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var friDayList = List<String>()
    @Persisted var date: Date
}
extension FriDayModel {
    //保存
    func addFriDay(subjectArray: [String], date: Date) {
        
        let friDayModel = FriDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            friDayModel.friDayList.append(subject)
        }
        
        //dateを追加
        friDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(friDayModel)
        }
    }
    //更新
    func updateFriDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(FriDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.friDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    //Listの中身の数を返す
    func countFriDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(FriDayModel.self).first!
        return firstObj.friDayList.count
    }
    
    //全削除(リセット)
    func deleteAllFriDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(FriDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}

//土曜日
class SaturDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var satursDayList = List<String>()
    @Persisted var date: Date
}
extension SaturDayModel {
    //保存
    func addSaturDay(subjectArray: [String], date: Date) {
        
        let saturDayModel = SaturDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            saturDayModel.satursDayList.append(subject)
        }
        
        //dateを追加
        saturDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(saturDayModel)
        }
    }
    //更新
    func updateSaturDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(SaturDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.satursDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    //Listの中身の数を返す
    func countSaturDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(SaturDayModel.self).first!
        return firstObj.satursDayList.count
    }
    
    //全削除(リセット)
    func deleteAllSaturDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(SaturDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}

//日曜日
class SunDayModel: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var sunDayList = List<String>()
    @Persisted var date: Date
}
extension SunDayModel {
    //保存
    func addSunDay(subjectArray: [String], date: Date) {
        
        let sunDayModel = SunDayModel()
        
        // subjectArrayをListの中に一つ一つappendしていく
        for subject in subjectArray {
            sunDayModel.sunDayList.append(subject)
        }
        
        //dateを追加
        sunDayModel.date = date
        
        //add実行
        guard let localRealm = try? Realm() else { return }
        try? localRealm.write {
            localRealm.add(sunDayModel)
        }
    }
    //更新
    func updateSunDay(subjectArray: [String], date: Date) {
        guard let localRealm = try? Realm() else { return }
        let firstObj = localRealm.objects(SunDayModel.self).first!
        try? localRealm.write {
            //scheduleList更新、配列順番で更新する。例：Listの0番目にsubjectArrayの0番目を更新する
            for subject in 0 ..< subjectArray.count {
                firstObj.sunDayList[subject] = subjectArray[subject]
            }
    
            //date更新
            firstObj.date = date
        }
    }
    //Listの中身の数を返す
    func countSunDayList() -> Int {
        guard let localRealm = try? Realm() else { return 0 }
        let firstObj = localRealm.objects(SunDayModel.self).first!
        return firstObj.sunDayList.count
    }
    
    //全削除(リセット)
    func deleteAllSunDay() {
        guard let localRealm = try? Realm() else { return }
        let allObj = localRealm.objects(SunDayModel.self)
        try? localRealm.write {
            localRealm.delete(allObj)
        }
    }
}

