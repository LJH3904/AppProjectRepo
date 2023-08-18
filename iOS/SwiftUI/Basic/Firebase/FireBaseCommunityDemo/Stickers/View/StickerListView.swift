//
//  StickerListView.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import SwiftUI

struct StickerListView: View {
    @StateObject private var stickerStore: StickerStore = StickerStore()
    
    @State private var isShowingAddView: Bool = false
    
    var body: some View {
        List(stickerStore.stickers) { sticker in
            NavigationLink {
                StickerDetailView(sticker: sticker)
            } label: {
                StickerCellView(sticker: sticker)
                    .contextMenu {
                        ShareLink(item: sticker.textForSharing)
                        
                        Button {
                            stickerStore.removeSticker(sticker)
                        } label: {
                            Label("Remove", systemImage: "trash")
                        }
                    }
            }
        }
        .navigationTitle("Stickers")
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isShowingAddView.toggle()
                } label: {
                    Label("Add", systemImage: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $isShowingAddView) {
            AddingStickerView(stickerStore: stickerStore, isShowingAddView: $isShowingAddView)
        }
        .refreshable {
            stickerStore.fetchStickers()
        }
        .onAppear {
            stickerStore.fetchStickers()
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StickerListView()
        }
    }
}
