//
//  CongratulationsGameView.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import Foundation
import SwiftUI

struct CongratulationsView: View {
    var body: some View {
        VStack {
            Image("logo") // Reemplaza con el nombre de tu logo
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200) // Ajusta el tamaño según sea necesario
            
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()

            VStack {
                Button(action: {
                    // Acción para continuar al siguiente nivel
                }) {
                    Text("Continue")
                        .frame(width: 200, height: 50)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15)                }

                Button(action: {
                    // Acción para reintentar el nivel
                }) {
                    Text("Play again")
                        .frame(width: 200, height: 50)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }

                Button(action: {
                    // Acción para regresar al menú
                }) {
                    Text("Menu")
                        .frame(width: 200, height: 50)
                        .font(.title2)
                        .bold()
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
    }
}
