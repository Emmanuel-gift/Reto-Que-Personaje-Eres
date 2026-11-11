import Foundation

// Lista de personajes y sus puntuaciones
let personajes = [
    "El Lider": 0,
    "El Explorador": 0,
    "El Estratega": 0,
    "El Creativo": 0,
    "El Protector": 0
]

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

let descripciones = [
    "Eres una persona que sabe dirigir y motivar a los demás.",
    "Tu curiosidad te impulsa a descubrir nuevos caminos.",
    "Tu inteligencia te ayuda a resolver problemas.",
    "Tu imaginación te permite crear ideas extraordinarias.",
    "Tu empatía y solidaridad hacen que siempre cuides a los demás."
]

let nombres = Array(personajes.keys).sorted()

var puntuaciones = Array(repeating: 0, count: 5)

print("¡BIENVENIDO AL CUESTIONARIO!")
print("Descubre qué personaje eres.\n")

for i in 0..<5 {
    print("Pregunta \(i + 1): \(preguntas[i])")

    for j in 0..<5 {
        print("\(j + 1). \(opciones[i][j])")
    }

    var respuestaValida = false

    while !respuestaValida {
        print("Selecciona una opción del 1 al 5:")

        if let entrada = readLine(),
           let respuesta = Int(entrada),
           respuesta >= 1 && respuesta <= 5 {

            puntuaciones[respuesta - 1] += 1
            respuestaValida = true

        } else {
            print("Opción no válida. Intenta nuevamente.")
        }
    }

    print("")
}

var indiceGanador = 0

for i in 1..<5 {
    if puntuaciones[i] > puntuaciones[indiceGanador] {
        indiceGanador = i
    }
}

print("¡CUESTIONARIO TERMINADO!")
print("Tu personaje es: \(nombres[indiceGanador])")
print(descripciones[indiceGanador])
