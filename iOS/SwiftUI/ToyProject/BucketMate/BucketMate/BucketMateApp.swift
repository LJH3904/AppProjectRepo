//
//  BucketMateApp.swift
//  BucketMate
//
//  Created by 유하은 on 2023/07/27.
//

import SwiftUI

@main
struct BucketMateApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PostStore())
        }
    }
}
