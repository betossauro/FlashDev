import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct Desafio: View {
    
    @State var counter: Int = 0
    @State var respostaSelecionada: Int? = nil
    @State var currentQuestionIndex: Int = 0
    
 
    var totalQuestions: Int {
        linguagem.perguntas.count
    }
    
    var countTo: Int = 45
    
    let linguagem: Linguagens
    
    
    var progressPercentage: Double {
        let currentQuestion = Double(currentQuestionIndex + 1)
        let total = Double(totalQuestions)
        return (currentQuestion / total) * 100
    }
    
    var progressoBinding: Binding<Double> {
        Binding<Double>(
            get: { self.progressPercentage },
            set: { _ in }
        )
    }
    
    var body: some View {
       
        VStack {
            HStack {
                Text(linguagem.linguagem)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.leading, 30)
                    .padding(.top, 20)
                Spacer()
                VStack{
                    ZStack{
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle().stroke(Color.white, lineWidth: 25)
                            )
                        
                        Circle()
                            .fill(Color.clear)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle().trim(from:0, to: progress())
                                    .stroke(
                                        style: StrokeStyle(
                                            lineWidth: 7,
                                            lineCap: .round,
                                            lineJoin:.round
                                        )
                                    )
                                    .foregroundColor(
                                        (completed() ? Color.red : Color.red)
                                    ).animation(
                                        .easeInOut(duration: 0.2)
                                    )
                            )
                        
                        Clock(counter: counter, countTo: countTo)
                    }
                }.onReceive(timer) { time in
                    if (self.counter < self.countTo) {
                        self.counter += 1
                    }
                }
                .padding(.trailing, 30)
            }
            HStack {
                Text("\(Int(progressPercentage))%")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading, 30)
                Spacer()
            }
            HStack (alignment: .center) {}.frame(width: 240, height: 2).background(Color.black)
                .padding(EdgeInsets(top: 4, leading: 24, bottom: 2, trailing: 24)).padding(.trailing, 30)
            
            VStack {
                ZStack {
                    Rectangle()
                                      .fill(
                                          LinearGradient(gradient: Gradient(colors: [Color(linguagem.colorDark), Color(linguagem.colorLight)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                      )
                                      .frame(width: 320, height: 260)
                                      .cornerRadius(20)
                                      .shadow(radius: 5)
                                      .padding(.top, 10)
                                      .shadow(radius: 2, y: 4)
                    
                    VStack {
                        HStack {
                            Text(linguagem.linguagem)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.top, 50)
                                .padding(.leading, 40)
                            Spacer()
                        }
                        HStack {
                            Text("Progresso:")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.leading, 40)
                            Text("\(currentQuestionIndex + 1)/\(totalQuestions)")
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .padding()
                            Spacer()
                        }
                        Divider()
                            .background(Color.gray)
                            .frame(maxWidth: .infinity)
                            .padding(.leading, 40)
                            .padding(.trailing, 40)
                        Text(linguagem.perguntas[currentQuestionIndex].pergunta)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: 270)
                            .padding(.top, 8)
                        Spacer()
                    }
                }
                HStack {
                    Text("Selecione a opção correta: ")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.leading, 30)
                        .padding(.bottom, 8)
                    
                    Spacer()
                }
                VStack {
                    VStack {
                        HStack {
                            Button(action: {
                                if let resposta = linguagem.perguntas[currentQuestionIndex].respostas.first {
                                    self.respostaSelecionada = 0
                                    checkAnswer(resposta)
                                    print("Clicou no primeiro retângulo: \(resposta.valor)")
                                    
                                }
                            }) {
                                RectangleButtonView(resposta: linguagem.perguntas[currentQuestionIndex].respostas.first, isSelected: respostaSelecionada == 0, respostaSelecionada: 0, gradient: linguagem.gradient)
                                
                            }
                            
                            Button(action: {
                                if let resposta = linguagem.perguntas[currentQuestionIndex].respostas.dropFirst().first {
                                    self.respostaSelecionada = 1
                                    checkAnswer(resposta)
                                    print("Clicou no segundo retângulo: \(resposta.valor)")
                                    
                                }
                            }) {
                                RectangleButtonView(resposta: linguagem.perguntas[currentQuestionIndex].respostas.dropFirst().first, isSelected: respostaSelecionada == 1, respostaSelecionada: 1, gradient: linguagem.gradient)
                            }
                        }
                        HStack {
                            Button(action: {
                                if let resposta = linguagem.perguntas[currentQuestionIndex].respostas.dropFirst(2).first {
                                    self.respostaSelecionada = 2
                                    checkAnswer(resposta)
                                    print("Clicou no terceiro retângulo: \(resposta.valor)")
                                    
                                }
                            }) {
                                RectangleButtonView(resposta: linguagem.perguntas[currentQuestionIndex].respostas.dropFirst(2).first, isSelected: respostaSelecionada == 2, respostaSelecionada: 2, gradient: linguagem.gradient)
                            }
                            Button(action: {
                                if let resposta = linguagem.perguntas[currentQuestionIndex].respostas.dropFirst(3).first {
                                    self.respostaSelecionada = 3
                                    checkAnswer(resposta)
                                    print("Clicou no quarto retângulo: \(resposta.valor)")
                                    
                                }
                            }) {
                                RectangleButtonView(resposta: linguagem.perguntas[currentQuestionIndex].respostas.dropFirst(3).first, isSelected: respostaSelecionada == 3, respostaSelecionada: 3, gradient: linguagem.gradient)
                            }
                        }
                    }
                    .padding(.bottom, 20)
                    
                }
            }.padding(.top, 10)
            Spacer()
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
    
    func nextQuestion() {
        if currentQuestionIndex < linguagem.perguntas.count - 1 {
            currentQuestionIndex += 1
            counter = 0
            respostaSelecionada = nil
        } else {
        }
    }
    
    
    func checkAnswer(_ resposta: Respostas) {
        if resposta.valor == true {
            nextQuestion()
        } else {
        }
    }
}

extension Linguagens {
    var gradient: LinearGradient {
        return LinearGradient(gradient: Gradient(colors: [Color(colorDark), Color(colorLight)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}


struct Clock: View {
    var counter: Int
    var countTo: Int
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 10))
                .fontWeight(.black)
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

struct RectangleButtonView: View {
    var resposta: Respostas?
    var isSelected: Bool
    var respostaSelecionada: Int?
    let gradient: LinearGradient

    init(resposta: Respostas?, isSelected: Bool, respostaSelecionada: Int?, gradient: LinearGradient) {
        self.resposta = resposta
        self.isSelected = isSelected
        self.respostaSelecionada = respostaSelecionada
        self.gradient = gradient
    }

    var body: some View {
        let backgroundColor: Color
        if let resposta = resposta, let respostaSelecionada = respostaSelecionada {
            backgroundColor = respostaSelecionada == resposta.hashValue ? (resposta.valor ? .green : .red) : .clear
        } else {
            backgroundColor = .clear
        }
        return Rectangle()
            .fill(backgroundColor)
            .frame(width: 150, height: 70)
            .background(gradient)
            .cornerRadius(8)
            .padding(2)
            .shadow(radius: 2, y: 4)
            .overlay (
                Text(resposta?.resposta ?? "")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
            )
    }
}
