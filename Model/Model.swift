import Foundation

struct Linguagens: Codable, Hashable {
    let _id: String
    let _rev: String
    let linguagem: String
    let perguntas: [Perguntas]
    let flashcards: [FlashCards]
    let categoria: String
    let colorDark: String
    let colorLight: String
    let imagem: String
    var progresso: Double
    
    var flashCardsCount: Int {
        return flashcards.count
    }
    
    var desafiosCount: Int {
        return perguntas.count
    }
}

struct Perguntas: Codable, Hashable {
    let pergunta: String
    let respostas: [Respostas]
}

struct Respostas: Codable, Hashable {
    let resposta: String
    let valor: Bool
}

struct FlashCards: Codable, Hashable {
    let descricao: String
    let hint: String
}
