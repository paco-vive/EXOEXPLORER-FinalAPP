//
//  StoryView.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//
import SwiftUI

struct StoryView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("Select Difficulty Level")
                    .font(.title)
                    .foregroundColor(.white)
                
                NavigationLink(destination: LevelSelectionView2()) {
                    Text("Beginner")
                        .frame(width: 200)
                        .frame(height: 50)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                NavigationLink(destination: LevelSelectionView2()) {
                    Text("Intermediate")
                        .frame(width: 200)
                        .frame(height: 50)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                
                NavigationLink(destination: LevelSelectionView2()) {
                    Text("Advanced")
                        .frame(width: 200)
                        .frame(height: 50)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15)                }
            }
            .padding()
        }
    }
}
