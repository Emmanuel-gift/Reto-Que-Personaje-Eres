
import SwiftUI

struct ContentView: View {

    let preguntas = [
        "¿Qué harías ante un problema difícil?",
        "¿Qué actividad prefieres?",
        "¿Cómo te describen tus amigos?",
        "¿Qué valoras más?",
        "¿Cuál sería tu papel en una aventura?"
    ]

    let opciones = [
        ["Organizar al equipo", "Explorar soluciones", "Analizar todo", "Crear algo nuevo", "Ayudar a los demás"],
        ["Dirigir", "Viajar", "Resolver acertijos", "Dibujar", "Cuidar animales"],
        ["Valiente", "Curioso", "Inteligente", "Imaginativo", "Amable"],
        ["Responsabilidad", "Libertad", "Conocimiento", "Creatividad", "Amistad"],
        ["El líder", "El aventurero", "El estratega", "El inventor", "El protector"]
    ]

    let personajes = [
        "El Líder",
        "El Explorador",
        "El Estratega",
        "El Creativo",
        "El Protector"
    ]

    let descripciones = [
        "Sabes dirigir, motivar y ayudar a los demás a alcanzar sus objetivos.",
        "Tu curiosidad te impulsa a descubrir nuevos caminos y vivir aventuras.",
        "Tu inteligencia y capacidad de análisis te ayudan a resolver problemas.",
        "Tu imaginación te permite transformar ideas en grandes creaciones.",
        "Tu empatía y solidaridad hacen que siempre cuides a los demás."
    ]

    @State private var preguntaActual = 0
    @State private var puntuaciones = [0, 0, 0, 0, 0]
    @State private var finalizado = false

    var ganador: Int {
        puntuaciones.indices.max {
            puntuaciones[$0] < puntuaciones[$1]
        } ?? 0
    }

    var body: some View {
        ZStack {
            Color(red: 0.94, green: 0.93, blue: 1.0)
                .ignoresSafeArea()

            VStack(spacing: 24) {

                Text("¿QUÉ PERSONAJE ERES?")
                    .font(.largeTitle.bold())
                    .multilineTextAlignment(.center)
                    .foregroundColor(.purple)

                if finalizado {
                    resultadoView
                } else {
                    Text("Pregunta \(preguntaActual + 1) de 5")
                        .font(.headline)
                        .foregroundColor(.purple)

                    ProgressView(value: Double(preguntaActual + 1), total: 5)
                        .tint(.purple)

                    Text(preguntas[preguntaActual])
                        .font(.title2.bold())
                        .multilineTextAlignment(.center)
                        .padding()

                    ForEach(0..<5, id: \.self) { indice in
                        Button {
                            seleccionarRespuesta(indice)
                        } label: {
                            Text(opciones[preguntaActual][indice])
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(15)
                        }
                    }

                    Spacer()
                }
            }
            .padding()
        }
    }

    var resultadoView: some View {
        VStack(spacing: 20) {
            Text("¡Tu personaje es!")
                .font(.title2)

            Text("⭐")
                .font(.system(size: 70))

            Text(personajes[ganador])
                .font(.largeTitle.bold())
                .foregroundColor(.purple)

            Text(descripciones[ganador])
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Button("Volver a jugar") {
                preguntaActual = 0
                puntuaciones = [0, 0, 0, 0, 0]
                finalizado = false
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
        }
    }

    func seleccionarRespuesta(_ indice: Int) {
        puntuaciones[indice] += 1

        if preguntaActual == 4 {
            finalizado = true
        } else {
            preguntaActual += 1
        }
    }
}
