//
//  ContentView.swift
//  AppleTVRemote
//
//  Created by Ilya Zelkin on 30.05.2022.
//

import SwiftUI
import PureSwiftUI

private let nearBlack = Color.white(0.02)

private let backgroundGradient = LinearGradient([.white(0.85), .white(0.65)], to: .bottomTrailing)
private let outerDialGradient = LinearGradient([.white(0.18), nearBlack], to: .bottomTrailing)
private let innerDialGradient = RadialGradient([.white(0.14), nearBlack], center: UnitPoint(0.8, 0.8), from: 40, to: 240)
private let innerDialHighlightGradient = LinearGradient([.white(0.7), .white(0.9)], to: .bottomTrailing)

struct AppleTVRemoteMainDial: View {
    var body: some View {
        
        let outerDialCircle = Circle().fill(outerDialGradient)
        
        ZStack {
            RoundedRectangle(70)
                .fill(backgroundGradient)
                .shadowColor(.black, 20, x: 10, y: 10)
            ZStack {
                outerDialCircle
                    .shadow(4, x: 2, y: 2)
                Group {
                    outerDialCircle
                    outerDialCircle
                        .rotate(180.degrees)
                        .frame(290)
                }
                .blur(16)
                Group {
                    innerDialGradient
                        .clipCircle()
                    Circle()
                        .stroke(innerDialHighlightGradient, lineWidth: 1)
                        .offset(1.5, 1.5)
                        .blur(1)
                    Circle()
                        .stroke(nearBlack, lineWidth: 4)
                }
                .frame(210)
                ForEach(0..<4) { index in
                    Circle()
                        .fillColor(.white(0.65))
                        .frame(7)
                        .xOffset(160)
                        .rotate(90.degrees * index)
                }
            }
            .frame(360)
        }
    }
}

struct AppleTVRemoteMainDial_Previews: PreviewProvider {
    struct AppleTVRemoteMainDial_Harness: View {
        
        var body: some View {
            AppleTVRemoteMainDial()
                .frame(400)
                .padding(50)
                .foregroundColor(.white(0.9))
                .backgroundColor(.white(0.1))
        }
    }
    
    static var previews: some View {
        AppleTVRemoteMainDial_Harness()
            .previewSizeThatFits()
    }
}
