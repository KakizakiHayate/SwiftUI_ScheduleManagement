//
//  ScheduleManagementApp.swift
//  ScheduleManagement
//
//  Created by 柿崎逸 on 2023/02/16.
//

import SwiftUI

@main
struct ScheduleManagementApp: App {
    var body: some Scene {
        WindowGroup {
         SelectView()
                .environmentObject(Migration())
        }
    }
}
