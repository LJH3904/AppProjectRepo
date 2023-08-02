//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by 박성훈 on 2023/08/01.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    var gradient :Gradient {
        return Gradient(colors: scrums.map({ scrum in
            scrum.theme.mainColor
        }))
    }
  let saveAction: ()-> Void
  
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: gradient, startPoint: .topLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                List($scrums) { $scrum in
                    NavigationLink(destination: DetailView(scrum: $scrum)) {
                        CardView(scrum: scrum)
                    }
                    .listRowBackground(scrum.theme.mainColor)
                }
                .navigationTitle("Daily Scrums")
                .toolbar {
                    Button(action: {
                        isPresentingNewScrumView = true
                    }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Scrum")
                }
                .scrollContentBackground(.hidden)
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumView(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase in
          if phase == .inactive { saveAction()}
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {

    static var previews: some View {
      ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
    }
}
