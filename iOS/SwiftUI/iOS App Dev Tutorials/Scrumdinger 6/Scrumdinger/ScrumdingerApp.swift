//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by LJh on 2023/08/01.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums){
                Task{
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                    }
                } // onAppear 를 ScrumsView에서 쓰는거 대신 여기다가 Task를 사용
            }
            .task {
                do{
                    try await store.load()
                }catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
