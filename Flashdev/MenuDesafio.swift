import SwiftUI

struct MenuDesafio: View {
    @StateObject var viewModel = ViewModel()
    //@EnvironmentObject var progressoStore: ProgressoStore
    //  var linguagens: [Linguagens] = []
    @State var arrLing : [Linguagens] = []
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("DESAFIOS")
                        .font(.title).bold()
                    Spacer()
                }
                HStack {
                    Text("Desafie seus conhecimentos adquiridos")
                        .font(.subheadline)
                }
            }
            .padding(.init(top: 8, leading: 32, bottom: 8, trailing: 0))
            
            HStack {
                
            }
            .frame(width: 300, height: 2)
            .background(Color.black)
            .cornerRadius(20)
            .padding(.bottom)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(arrLing, id: \.self) { index in
                        let gradientColors = [Color(index.colorDark), Color(index.colorLight)]
                        
                        NavigationLink(destination: Desafio(linguagem: index)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(index.linguagem)
                                        .font(.title2)
                                        .foregroundStyle(Color.white)
                                        .fontWeight(.black)
                                        .padding(.init(top: 0, leading: 0, bottom: 2, trailing: 0))
//                                    HStack {
//                                        Text("Progresso:")
//                                            .font(.headline)
//                                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                            .foregroundStyle(Color.white)
//                                        Text("\(index.progresso, specifier: "%.2f")%")
//                                            .font(.title3)
//                                            .foregroundStyle(Color.white)
//                                            .bold()
//                                    }
                                    HStack {
                                        VStack(alignment: .leading) {
                                            Text("FlashCards")
                                                .font(.subheadline)
                                                .foregroundStyle(Color.white)
                                                .fontWeight(.bold)
                                            Text("\(index.flashCardsCount)")
                                                .font(.headline)
                                                .foregroundStyle(Color.white)
                                                .fontWeight(.bold)
                                        }
                                        VStack(alignment: .leading) {
                                            Text("Desafios")
                                                .font(.subheadline)
                                                .foregroundStyle(Color.white)
                                                .fontWeight(.bold)
                                            Text("\(index.desafiosCount)")
                                                .font(.headline)
                                                .foregroundStyle(Color.white)
                                                .fontWeight(.bold)
                                        }
                                    }.padding(.init(top: 2, leading: 2, bottom: 2, trailing: 20))
                                    
                                }
                                .padding()
                                Spacer()
                                VStack {
                                    AsyncImage(url: URL(string: index.imagem)) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 60, height: 60)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                }
                                .clipShape(Circle())
                                .shadow(radius: 4, y: 4)
                                Spacer()
                            }
                            .frame(width: 320, height: 150)
                            .background(
                                LinearGradient(colors: gradientColors, startPoint: .leading, endPoint: .center)
                                    .ignoresSafeArea()
                                    .cornerRadius(20)
                            )
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchLinguagens()
                // progressoStore.linguagensProgresso = viewModel.linguagens
                
                arrLing=[]
                for l in Global.ling{
                    arrLing.append(l)
                    print(l)
                }
            }
        }
    }
    //    private func totalProgresso() -> Double {
    //        var total: Double = 0
    //        for linguagem in progressoStore.linguagensProgresso {
    //            total += linguagem.progresso
    //        }
    //        return total / Double(progressoStore.linguagensProgresso.count)
    //    }
    //}
    
    struct MenuDesafio_Previews: PreviewProvider {
        static var previews: some View {
            MenuDesafio(viewModel: ViewModel())
               // .environmentObject(ProgressoStore())
        }
    }
}
