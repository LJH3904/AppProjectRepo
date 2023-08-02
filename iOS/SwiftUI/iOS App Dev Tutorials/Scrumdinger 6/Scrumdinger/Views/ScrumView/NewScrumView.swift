//
//  NewScrumView.swift
//  Scrumdinger
//
//  Created by JOHNNY_MAC_1 on 2023/08/02.
//

import SwiftUI

struct NewScrumView: View {
    @State private var newScrum = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrum)
                            
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewScrumView_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumView(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
