//
//  ContentView.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 05/10/24.
//

import SwiftUI

struct GameMenuScreen: View {
    @State private var isButtonPressed: Bool = false // Estado para controlar la transparencia

    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                // Canvas para el fondo visual
                Canvas { context, size in
                    // Dibujar un gradiente de fondo
                    _ = Gradient(colors: [.black, .blue])
                    let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                    _ = Path(rect)
                }
                .ignoresSafeArea() // Asegura que el Canvas ocupa toda la pantalla
                
                VStack(spacing: 12) {
                    Image("logo")
                        .resizable()  // Para que sea redimensionable
                        .scaledToFit() // Escala la imagen a las proporciones correctas
                        .frame(width: 300, height: 300) // Cambia el tamaño según lo necesites
                        .padding(.top, 40)
                        .padding(.bottom, 40) // Ajuste para que no esté tan pegado al siguiente contenido

                    Text("ExoGame") // Texto principal
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    VStack(spacing: 12) {
                        NavigationLink(destination: StoryView()) {
                            Text("Space gems!")
                                .frame(width: 200, height: 50)
                                .font(.title2)
                                .bold()
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        NavigationLink(destination:LevelSelectionView()) {
                            Text("Constellations")
                                .frame(width: 200, height: 50)
                                .font(.title2)
                                .bold()
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        NavigationLink(destination: SettingsView()) {
                            Text("Settings")
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
                .padding(.bottom, 50) // Ajusta el espaciado en la parte inferior
            }
        }
    }
}

struct GameMenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameMenuScreen()
    }
}
