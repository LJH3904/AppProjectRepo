//
//  TimeAttackApp.swift
//  TimeAttack
//
//  Created by LJh on 2023/07/25.
//

import SwiftUI

@main
struct TimeAttackApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(TimerData())
        }
    }
}
