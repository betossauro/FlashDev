import SwiftUI

struct FlashCard: View {
    
    var progress = 30
    
    @State var pLinguagem : Linguagens =
    Linguagens(
        _id: "1597a59c797e5b7f238765f34f1bc592",
        _rev: "1-eaf70256358bef2b381a2013cd8f96bf",
        linguagem: "Python",
        perguntas: [
            Perguntas(pergunta: "Qual é a estrutura de dados básica para armazenar múltiplos itens em Python?",
                      respostas: [
                        Respostas(resposta: "Lista", valor: true),
                        Respostas(resposta: "Dicionário", valor: false),
                        Respostas(resposta: "Tupla", valor: false),
                        Respostas(resposta: "Conjunto", valor: false)
                      ]
                     ),
            Perguntas(pergunta: "Qual é a estrutura de dados básica para armazenar múltiplos itens em Python? 2",
                      respostas: [
                        Respostas(resposta: "Lista", valor: true),
                        Respostas(resposta: "Dicionário", valor: false),
                        Respostas(resposta: "Tupla", valor: false),
                        Respostas(resposta: "Conjunto", valor: false)
                      ]
                     ),
            Perguntas(pergunta: "Qual é a estrutura de dados básica para armazenar múltiplos itens em Python? 3",
                      respostas: [
                        Respostas(resposta: "Lista 2", valor: true),
                        Respostas(resposta: "Dicionário", valor: false),
                        Respostas(resposta: "Tupla", valor: false),
                        Respostas(resposta: "Conjunto", valor: false)
                      ]
                     )
        ],
        flashcards: [
            FlashCards(descricao: "Definição de função", hint:"Usando a palavra-chave 'def'"),
            FlashCards(descricao: "Estrutura de dados básica 2 ", hint: "Lista"),
            FlashCards(descricao: "Estrutura de dados básica 4", hint: "Lista 2")
        ],
        categoria: "backend",
        colorDark: "PythonDark",
        colorLight: "PythonLight",
        imagem: "https://ojt.com/wp-content/uploads/2021/08/python-programming-language.png",
        progresso: 0
    )
    
    @StateObject var vm = ViewModel()
    @State var cardAtual = FlashCards(descricao: "", hint: "")
    @State var pagAtual: Int = 1
    var body: some View {
        
        VStack {
            ScrollView {
            
                    VStack(alignment: .leading){
                        HStack {
                            Text(pLinguagem.linguagem).font(.title).textCase(.uppercase).bold()
                            Spacer()
                        }
                        
                    }.padding(.init(top: 8, leading: 32, bottom: 8, trailing: 0))
                    VStack {
                        
                        Card(cd: pLinguagem.colorDark, cl: pLinguagem.colorLight, name: pLinguagem.linguagem, card: pagAtual, maxCards: pLinguagem.flashcards.count, question: cardAtual.hint, answer: cardAtual.descricao)
                        
                    }.padding(.bottom)
                HStack {
                    Spacer()
                    Button("Voltar") {
                        cardAtual = pLinguagem.flashcards.before(cardAtual)!
                        if(pagAtual>1){
                            self.pagAtual -= 1
                        }
                    }
                    Spacer()
                    Button("Avançar") {
                        cardAtual =  pLinguagem.flashcards.after(cardAtual)!
                        if(pagAtual<pLinguagem.flashcards.count){
                            self.pagAtual += 1
                        }
                    }
                    Spacer()
                }.padding(.bottom)
            }
        }.onAppear() {
            vm.fetchLinguagens()
            cardAtual = pLinguagem.flashcards[0]
        }
    }
}

#Preview {
    FlashCard()
}



struct Card: View{
    
    // @State var flashCard : FlashCard
    @State var shouldDisappear = false
    @State var flipping = false
    var cd: String
    var cl: String
    var name: String
    
    var card: Int
    var maxCards: Int
    
    var question: String
    var answer: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient(gradient: Gradient(colors: [Color(cd), Color(cl)]),
                                   startPoint: .top,
                                   endPoint: .bottom))
                .frame(width: 300, height: 480)
                .rotation3DEffect(
                    .degrees(flipping ? 180 : 0), axis: (x: 0.0, y: 1.0, z: 0.0)
                )
            VStack (alignment: .leading) {
                if flipping {
                    Text(name)
                        .font(.title).bold()
                        .foregroundStyle(Color.white).padding(EdgeInsets(top: -40, leading: 24, bottom: 4, trailing: 0))
                    Text("\(card)/\(maxCards)").font(.subheadline)
                        .foregroundStyle(Color.white).padding(EdgeInsets(top: 0, leading: 24, bottom: 4, trailing: 0))
                    HStack (alignment: .center) {}.frame(width: 200, height: 2).background(Color.white).padding(EdgeInsets(top: 4, leading: 24, bottom: 20, trailing: 0))
                    Text(answer)
                        .font(.headline).bold()
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 240, height: 250)
                } else {
                    Text(name)
                        .font(.title).bold()
                        .foregroundStyle(Color.white).padding(EdgeInsets(top: -40, leading: 24, bottom: 4, trailing: 0))
                    Text("\(card)/\(maxCards)").font(.subheadline)
                        .foregroundStyle(Color.white).padding(EdgeInsets(top: 0, leading: 24, bottom: 4, trailing: 0))
                    HStack (alignment: .center) {}.frame(width: 200, height: 2).background(Color.white).padding(EdgeInsets(top: 4, leading: 24, bottom: 20, trailing: 0))
                    Text(question)
                        .font(.largeTitle).bold()
                        .foregroundStyle(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 250, height: 250)
                }
            }.opacity(shouldDisappear ? 0 : 1)
        }
        .onTapGesture {
            shouldDisappear.toggle()
            withAnimation(.easeInOut(duration: 0.5)) {
                flipping.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    shouldDisappear = false
                }
            }
        }
    }
}
