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


