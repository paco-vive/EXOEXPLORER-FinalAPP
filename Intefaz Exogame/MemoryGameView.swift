import SwiftUI

struct MemoryGameView: View {
    let constellation: Constellation // Recibe la constelación para el nivel

    @State private var showConstellation = true
    @State private var userSelectedStars: [Star] = []
    @State private var levelCompleted = false // Nuevo estado para controlar si el nivel se completó
    @State private var timeRemaining: TimeInterval = 10.0 // Tiempo inicial para la cuenta atrás
    @State private var timer: Timer? // Timer para la cuenta atrás

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if levelCompleted {
                CongratulationsView() // Mostrar vista de felicitaciones
            } else {
                // Mostrar la constelación si el flag está en true
                if showConstellation {
                    ForEach(constellation.stars) { star in
                        Circle()
                            .frame(width: 12, height: 12)
                            .position(star.position)
                            .foregroundColor(.white)
                    }

                    Path { path in
                        for connection in constellation.connections {
                            path.move(to: connection.from.position)
                            path.addLine(to: connection.to.position)
                        }
                    }
                    .stroke(Color.white, lineWidth: 2)

                    // Mostrar la cuenta atrás
                    Text(String(format: "%.1f", timeRemaining))
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .position(x: UIScreen.main.bounds.width / 2, y: 50)
                }

                // Después del tiempo de muestra, deja que el usuario seleccione estrellas
                if !showConstellation {
                    // Mostrar las estrellas correctas
                    ForEach(constellation.stars) { star in
                        Circle()
                            .frame(width: 15, height: 15)
                            .position(star.position)
                            .foregroundColor(userSelectedStars.contains(star) ? .green : .gray)
                            .onTapGesture {
                                if !userSelectedStars.contains(star) {
                                    userSelectedStars.append(star)
                                }
                            }
                    }

                    // Mostrar las estrellas trampa
                    ForEach(constellation.trapStars) { star in
                        Circle()
                            .frame(width: 15, height: 15)
                            .position(star.position)
                            .foregroundColor(userSelectedStars.contains(star) ? .red : .gray)
                            .onTapGesture {
                                if !userSelectedStars.contains(star) {
                                    userSelectedStars.append(star)
                                }
                            }
                    }
                }
            }
        }
        .onAppear {
            // Iniciar la cuenta atrás
            startTimer()
        }
        .onChange(of: userSelectedStars) { _ in
            // Validar si el usuario ha completado correctamente o si ha tocado trampas
            checkUserSelection()
        }
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 0.1
            } else {
                showConstellation = false
                timer?.invalidate()
                timer = nil
            }
        }
    }

    func checkUserSelection() {
        let correctStars = Set(userSelectedStars).intersection(constellation.stars)
        let trapStars = Set(userSelectedStars).intersection(constellation.trapStars)

        if trapStars.count > 0 {
            print("Has tocado una estrella trampa. ¡Intenta de nuevo!")
        } else if correctStars.count == constellation.stars.count {
            levelCompleted = true // Actualiza el estado al completar el nivel
            print("¡Constelación completada correctamente!")
        } else {
            print("Sigue seleccionando las estrellas correctas.")
        }
    }
}
