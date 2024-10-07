//
//  LevelSelectionView.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import SwiftUI
struct LevelSelectionView: View {
    var body: some View {
        NavigationView {
            ZStack{
                Color.black
                    .ignoresSafeArea()
                VStack {
                    Text("Levels")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    Text("Do as the antiques did...")
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                    ScrollView{
                        ForEach(0..<7, id: \.self) { level in
                            NavigationLink(destination: MemoryGameView(constellation: constellationForLevel(level))) {
                                Text("\(level + 1): \(constellationForLevel(level).name)")
                                    .frame(width: 200, height: 50)
                                    .font(.title2)
                                    .bold()
                                    .padding()
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(15)
                            }
                            .padding(.bottom, 10)
                        }
                        
                        Spacer()
                    }
                }
            }
        }
    }
    
    func constellationForLevel(_ level: Int) -> Constellation {
        let constellations = [
            orionConstellation,
            cassiopeiaConstellation,
            ursaMajorConstellation,
            ursaMinorConstellation,
            dracoConstellation,
            geminiConstellation,
            taurusConstellation
        ]
        return constellations[level]
    }
}
