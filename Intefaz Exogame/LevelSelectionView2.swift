//
//  StoryView.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import SwiftUI

struct LevelSelectionView2: View {
    // Niveles desbloqueados, en este caso del 1 al 8
    let unlockedLevels = 3
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Select Level")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 50)
                
                // ScrollView para contener los niveles
                ScrollView {
                    VStack(spacing: 15) {
                        // Generar botones de niveles del 1 al 15
                        ForEach(1..<16) { level in
                            if level <= unlockedLevels {
                                // Niveles desbloqueados
                                NavigationLink(destination: Text("Level \(level)")) {
                                    Text("Level \(level)")
                                        .frame(width: 250, height: 50)
                                        .font(.title2)
                                        .bold()
                                        .padding()
                                        .background(Color.gray)
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                }
                            } else {
                                // Niveles bloqueados
                                Button(action: {
                                    // Acción para mostrar un mensaje de nivel bloqueado
                                    print("Level \(level) is locked")
                                }) {
                                    Text("Level \(level) - Locked")
                                        .frame(width: 250, height: 50)
                                        .font(.title2)
                                        .bold()
                                        .padding()
                                        .background(Color.black)
                                        .foregroundColor(.white)
                                        .cornerRadius(15)
                                }
                                .disabled(true) // Desactivar interacción para niveles bloqueados
                            }
                        }
                    }
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
    }
}

struct LevelSelectionView2_Previews: PreviewProvider {
    static var previews: some View {
        LevelSelectionView2()
    }
}

