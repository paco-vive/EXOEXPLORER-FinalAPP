//
//  pantallaPrincipal.swift
//  Intefaz Exogame
//
//  Created by iOS Lab on 06/10/24.
//

import Foundation
import SwiftUI

struct OverlayImageView: View {
    var backgroundImageName: String

    var body: some View {
        ZStack {
            Image(backgroundImageName)
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ContentView: View {
    @State private var showLoginView: Bool = false
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color.black.ignoresSafeArea()
                OverlayImageView(backgroundImageName: "Image 1")
                    .ignoresSafeArea()
                
                // Imagen en la parte superior derecha
                Image("Image") // Cambia por el nombre de tu imagen
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 250) // Ajusta el tamaño según sea necesario
                    .padding() // Para agregar algo de espacio alrededor de la imagen
                    .position(x: 320, y: 100) // Posición en la pantalla
                
                VStack(spacing: 20) {
                    ZStack {
                        NavigationLink(destination: esferasView()){
                            Rectangle()
                                .fill(Color(red: 0.6, green: 0.6, blue: 1.0).opacity(0.8))
                                .frame(width: 300, height: 250)
                                .cornerRadius(40) // Ajusta el valor según lo que necesites
                                .position(x: 188, y: 280) // Posición en la pantalla
                            
                            Text("EXOEXPLORER")
                                .font(.system(size: 30, weight: .heavy)) // Ajusta el tamaño como necesites
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .position(x: 60, y: 230)
                            
                            Text("Explore exoplanets \n and stars")
                                .font(.system(size: 24, weight: .semibold)) //
                                .foregroundColor(.white)
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .position(x: -70, y: 340) // Posición en la pantal
                            
                        }}
                    .frame(maxWidth: .infinity, alignment: .center)
                    ZStack {
                        NavigationLink(destination: GameMenuScreen()) {
                            Rectangle()
                                .fill(Color.black.opacity(0.7))
                                .frame(width: 150, height: 250)
                                .cornerRadius(40)
                                .position(x: 100, y:103 )
                            Text("ExoGame")
                                .font(.system(size: 28, weight: .heavy))
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                                .lineLimit(0)
                                .frame(width: nil)
                                .position(x: -85, y: 100)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.black.opacity(0.7))
                                .frame(width: 150, height: 250)
                                .cornerRadius(40)
                                .position(x: 280, y: 103)
                            
                            Text("VR")
                                .foregroundColor(.white)
                                .font(.system(size: 40, weight: .heavy)) .multilineTextAlignment(.center)
                                .position(x: 280, y: 30)
                            Text("Watch in\n virtual reality \n some \n exoplanets")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .semibold)) .multilineTextAlignment(.center)
                                .position(x: 280, y: 120)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                        Spacer()
                    }
                    .padding()
                    .edgesIgnoringSafeArea(.all)
                }
                .navigationBarTitle("Inicio", displayMode: .inline)
                .navigationBarItems(leading: Button(action: {
                    showLoginView = true
                }) {
                    Text("Back")
                        .foregroundColor(.blue)
                })
                .background(
                    NavigationLink(destination: LoginView(showMainView: $showLoginView), isActive: $showLoginView) {
                        EmptyView()
                    }
                )
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    struct LoginView: View {
        @Binding var showMainView: Bool
        @State private var email: String = ""
        @State private var password: String = ""
        @State private var showWelcomeView: Bool = false
        @State private var loginError: String?
        
        var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()
                Image("exoplanet")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(180))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(y: -400)
                    .clipped()
                
                VStack(spacing: 30) {
                    Text("Iniciar Sesión")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(width: 290.0, height: 50.043)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 3).fill(Color.gray.opacity(0.2)))
                    
                    SecureField("Contraseña", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        .frame(width: 290.0, height: 50.043)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(Color.blue, lineWidth: 3).fill(Color.gray.opacity(0.2)))
                    
                    if let error = loginError {
                        Text(error)
                            .foregroundColor(.red)
                            .padding()
                    }
                    
                    Button(action: {
                        iniciarSesion()
                    }) {
                        Text("Iniciar Sesión")
                            .frame(width: 252.0, height: 20.0)
                            .padding()
                            .background(Color(red: 0.0, green: 0.9, blue: 1.0))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                    
                    NavigationLink(destination: WelcomeView(), isActive: $showWelcomeView) {
                        EmptyView()
                    }
                }
                .padding()
                .navigationBarTitle("Iniciar Sesión", displayMode: .inline)
                .navigationBarBackButtonHidden(false)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
        
        private func iniciarSesion() {
            if email.isEmpty || password.isEmpty {
                loginError = "Por favor, complete todos los campos."
            } else {
                print("Iniciando sesión con email: \(email) y contraseña: \(password)")
                showMainView = false
                showWelcomeView = true
            }
        }
    }
    
    struct WelcomeView: View {
        @State private var showImage: Bool = true
        
        var body: some View {
            ZStack {
                Color.black.ignoresSafeArea()
                if showImage {
                    Image("exo") // Cambia "exo" por el nombre de tu imagen
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                                showImage = false
                            }
                        }
                }
                
                Text("¡Welcome!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .opacity(showImage ? 0 : 1) // Ocultar texto mientras la imagen se muestra
            }
        }
    }
    
}
struct Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
