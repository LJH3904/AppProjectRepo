//
//  AddingStickerView.swift
//  Stickers
//
//  Created by Jongwook Park on 2023/08/18.
//

import SwiftUI

struct AddingStickerView: View {
    var stickerStore: StickerStore
    @Binding var isShowingAddView: Bool
    
    @State private var memo: String = ""
    @State private var colorIndex: Int = 0
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    var trimMemo: String {
        memo.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Form {
                    Section("Color") {
                        HStack {
                            ForEach(Array(colors.enumerated()), id: \.offset) { (index, color) in
                                
                                Button {
                                    colorIndex = index
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .foregroundColor(color)
                                            .shadow(radius: 3)
                                            .frame(height: 60)
                                        
                                        if index == colorIndex {
                                            Image(systemName: "checkmark")
                                                .font(.title)
                                                .foregroundColor(.white)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                    Section("Memo") {
                        TextField("Add your memo", text: $memo, axis: .vertical)
                    }
                    .padding()
                }
                .formStyle(.columns)
            }
            .navigationTitle("New sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading)  {
                    Button("Cancel") {
                        isShowingAddView.toggle()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing)  {
                    Button("Submit") {
                        let sticker = Sticker(memo: trimMemo, colorIndex: colorIndex)
                        stickerStore.addSticker(sticker)
                        
                        isShowingAddView.toggle()
                    }
                    .disabled(trimMemo.isEmpty)
                }
            }
        }
    }
}

struct AddingStickerView_Previews: PreviewProvider {
    static var previews: some View {
        AddingStickerView(stickerStore: StickerStore(), isShowingAddView: .constant(true))
    }
}
