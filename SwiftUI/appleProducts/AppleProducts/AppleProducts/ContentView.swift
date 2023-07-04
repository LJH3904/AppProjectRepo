//
//  ContentView.swift
//  AppleProducts
//
//  Created by 전민석 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("iPhone").textCase(.none)) {
                    ForEach(iPhoneArray) { iphone in
                        NavigationLink {
                            IPhoneInfoView(iphone: iphone)
                        } label: {
                            Text("\(iphone.name)")
                        }
                        
                    }
                }
                
                Section(header: Text("iPad").textCase(.none)) {
                    ForEach(iPadArray) { ipad in
                        NavigationLink {
                            IPadInfoView(ipad: ipad)
                        } label: {
                            Text("\(ipad.name)")
                        }
                    }
                }
                
                Section(header: Text("Mac").textCase(.none)) {
                    ForEach(macArray) { mac in
                        NavigationLink {
                            MacInfoView(mac: mac)
                        } label: {
                            Text("\(mac.name)")
                        }
                    }
                }
                
                Section(header: Text("Apple Watch").textCase(.none)) {
                    ForEach(appleWatchArray) { watch in
                        NavigationLink {
                            AppleWatchInfoView(appleWatch: watch)
                        } label: {
                            Text("\(watch.name)")
                        }
                    }
                }
                
                Section(header: Text("Apple TV").textCase(.none)) {
                    ForEach(appleTVArray) { tv in
                        NavigationLink {
                            AppleTVInfoView(appleTV: tv)
                        } label: {
                            Text("\(tv.name)")
                        }
                    }
                }
            }
            .navigationTitle("Apple Products")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
