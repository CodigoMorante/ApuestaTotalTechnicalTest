//
//  MedalCards.swift
//  ApuestaTotalTechnicalTest
//
//  Created by Christian Morante on 24/10/25.
//
import SwiftUI

struct MedalCards: View {
    
    @State private var rotation: Double = 0
    @State private var isFlipped = false
    var medal: Medal
    
    var body: some View {
        ZStack {
            if isFlipped {
                VStack(alignment: .center, spacing: 0) {
                    Text(medal.reward)
                        .foregroundStyle(.red)
                    Text(medal.nextLevelGoal)
                        .foregroundStyle(.gray)
                    Text(medal.description)
                        .foregroundStyle(.yellow)
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                .background(Color(hex: medal.backgroundColor))
                .cornerRadius(12)
                .shadow(radius: 4)
                .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
            }
            else {
                VStack(alignment: .center, spacing: 0) {
                    ScrollView {
                        Text("\(medal.level)")
                            .foregroundStyle(Color(hex: medal.progressColor))
                            .font(.system(size: 18, weight: .bold))
                        Text(medal.name)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.black)
                            .shadow(color: Color(hex: medal.progressColor).opacity(1), radius: 15, x: 4, y: 4)
                        AsyncImage(url: URL(string: medal.icon)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(height: 80)
                                .frame(maxWidth: .infinity)
                        } placeholder: {
                            ProgressView()
                        }
                        Text(medal.category)
                            .foregroundStyle(.blue)
                        Text("\(medal.points)")
                            .foregroundStyle(.purple)
                        Text(medal.rarity)
                            .foregroundStyle(.green)
                        Text("\(medal.maxLevel)")
                            .foregroundStyle(.orange)
                    }
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                .background(Color(hex: medal.backgroundColor))
                .cornerRadius(12)
                .shadow(radius: 4)
            }
        }
        .rotation3DEffect(
            .degrees(rotation),
            axis: (x: 0, y: 1, z: 0)
        )
        .gesture(
            DragGesture()
                .onEnded { value in
                    if abs(value.translation.width) > 50 {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            rotation += 180
                            isFlipped.toggle()
                        }
                    }
                }
        )

    }
}
