//
//  SliderPathBetweenView.swift
//  BucketMate
//
//  Created by gnksbm on 2023/07/27.
//

import SwiftUI

struct SliderPathBetweenView: View {
    @ObservedObject var slider: CustomSlider
    
    var body: some View {
        Path { path in
            path.move(to: slider.lowHandle.currentLocation)
            path.addLine(to: slider.highHandle.currentLocation)
        }
        .stroke(Color.bucketColor, lineWidth: slider.lineWidth)
    }
}
