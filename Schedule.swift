////
////  Schedule.swift
////  ScheduleManagement
////
////  Created by 柿崎逸 on 2023/03/07.
////
//
//import Foundation
//import RealmSwift
//
//class Schedule: Object, ObjectKeyIdentifiable {
//    @Persisted(primaryKey: true) var _id: ObjectId
//    @Persisted var firstPeriod: String? = nil
//    @Persisted var twoPeriod: String? = nil
//    @Persisted var threePeriod: String? = nil
//    @Persisted var fourPeriod: String? = nil
//    @Persisted var fivePeriod: String? = nil
//    @Persisted var sixPeriod: String? = nil
//    @Persisted var sevenPeriod: String? = nil
//    @Persisted var eightPeriod: String? = nil
//    @Persisted var ninePeriod: String? = nil
//    @Persisted var tenPeriod: String? = nil
//}
//
//extension Schedule {
//
//    // 2
//    //追加
//    func addSchedule(subjectArray: [String]) {
//        let schedule = Schedule()
//
//        //subjectArrayは、1以下にならないようにしている。RevisionSheetファイル参照
//        if subjectArray.count == 1 {
//            firstPeriod = subjectArray[0]
//        }
//
//        if subjectArray.count > 1 {
//            twoPeriod = subjectArray[1]
//        }
//
//        if subjectArray.count > 2 {
//            threePeriod = subjectArray[2]
//        }
//
//        if subjectArray.count > 3 {
//            fourPeriod = subjectArray[3]
//        }
//
//        if subjectArray.count > 4 {
//            fivePeriod = subjectArray[4]
//        }
//
//        if subjectArray.count > 5 {
//            sixPeriod = subjectArray[5]
//        }
//
//        if subjectArray.count > 6 {
//            sevenPeriod = subjectArray[6]
//        }
//
//        if subjectArray.count > 7 {
//            eightPeriod = subjectArray[7]
//        }
//
//        if subjectArray.count > 8 {
//            ninePeriod = subjectArray[8]
//        }
//
//        //10までしか配列にappendできないようにしている。RevisionSheetファイル参照
//        if subjectArray.count == 10 {
//            tenPeriod = subjectArray[9]
//        }
//
//        guard let localRealm = try? Realm() else { return }
//        try? localRealm.write {
//            localRealm.add(schedule)
//        }
//
//        // 3 でScheduleを全部保存した後にaddScheduleListも保存
//        let scheduleGroup = ScheduleGroup()
//        scheduleGroup.addScheduleGroup()
//    }
//
//    //更新
//    func updateSchedule(subjectArray: [String]) {
//        guard let localRealm = try? Realm() else { return }
//        let schedule = localRealm.objects(Schedule.self).first!
//
//        if subjectArray.count == 1 {
//            try? localRealm.write {
//                schedule.firstPeriod = subjectArray[0]
//            }
//        }
//
//        if subjectArray.count > 1 {
//            try? localRealm.write {
//                schedule.twoPeriod = subjectArray[1]
//            }
//        }
//
//        if subjectArray.count > 2 {
//            try? localRealm.write {
//                schedule.threePeriod = subjectArray[2]
//            }
//        }
//
//        if subjectArray.count > 3 {
//            try? localRealm.write {
//                schedule.fourPeriod = subjectArray[3]
//            }
//        }
//
//        if subjectArray.count > 4 {
//            try? localRealm.write {
//                schedule.fivePeriod = subjectArray[4]
//            }
//        }
//
//        if subjectArray.count > 5 {
//            try? localRealm.write {
//                schedule.sixPeriod = subjectArray[5]
//            }
//        }
//
//        if subjectArray.count > 6 {
//            try? localRealm.write {
//                schedule.sevenPeriod = subjectArray[6]
//            }
//        }
//
//        if subjectArray.count > 7 {
//            try? localRealm.write {
//                schedule.eightPeriod = subjectArray[7]
//            }
//        }
//
//        if subjectArray.count > 8 {
//            try? localRealm.write {
//                schedule.ninePeriod = subjectArray[8]
//            }
//        }
//
//        if subjectArray.count == 10 {
//            try? localRealm.write {
//                schedule.tenPeriod = subjectArray[9]
//            }
//        }
//
//    }//updateSchedule
//
////    func deleteSchedule(deleteSchedule: Schedule) {
////        guard let localRealm = try? Realm() else { return }
////        try? localRealm.write {
////            localRealm.delete(deleteSchedule)
////        }
////    }
//
//    static func fetchAllSchedule() -> [Schedule]? {
//        guard let localRealm = try? Realm() else { return nil }
//        let scheduleObject = localRealm.objects(Schedule.self)
//
//        return Array(scheduleObject)
//    }
//
//
//}//extension
