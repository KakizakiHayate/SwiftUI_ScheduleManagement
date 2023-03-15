////
////  ChangeObject.swift
////  ScheduleManagement
////
////  Created by 柿崎逸 on 2023/03/10.
////
//
//import Foundation
//
//enum ChangeObjectModel: Int {
//    case monDay = 1
//    case tuesDay = 2
////    case wednesDay = 3
////    case thursDay = 4
////    case friDay = 5
////    case saturDay = 6
////    case sunDay = 7
//}
//
//extension ChangeObjectModel {
//    func changeObject(changeObjectInt: Int) {
//
//        guard changeObjectInt ... 7 else { return 0 }
//        //代入するオブジェクト分岐
//        let changeObjectModel: ChangeObjectModel
//        switch changeObjectInt {
//            case 1:
//                changeObjectModel = ChangeObjectModel.monDay
//            case 2:
//                changeObjectModel = ChangeObjectModel.tuesDay
//            default:
//                break
//        }
//        
//        let changeObject: Any
//        switch changeObjectModel {
//            case .monDay:
//                changeObject = ScheduleGroup()
//            case .tuesDay:
//                changeObject = TuesDayModel()
////            case .wednesDay:
////            case .thursDay:
////            case .friDay:
////            case .saturDay:
////            case .sunDay:
//        }
//    }
//}
