////
////  RevisionSheetModel.swift
////  ScheduleManagement
////
////  Created by 柿崎逸 on 2023/02/18.
////
//
import Foundation

class Migration: ObservableObject {
    @Published var nextMigration: UInt64 = 2
}

//struct RevisionModel {
//    //sheetが開いた時の曜日をviewによって表示を変更
//    func changeDay(changeObjectInt: Int) -> String {
//        var changeDayStr: String
//        switch changeObjectInt {
//            case 1:
//                changeDayStr = "月"
//
//            case 2:
//                changeDayStr = "火"
//            default:
//                return ""
//        }
//        return changeDayStr
//
//    }
//}
