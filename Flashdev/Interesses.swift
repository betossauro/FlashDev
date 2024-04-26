import SwiftUI

struct Interesses: View {
    @State private var selectedCategory: String?
    @StateObject var viewModel = ViewModel()
    @State private var linguagens: [Linguagens] = []

    var body: some View {
        NavigationStack{
            ZStack {
                Color.white.ignoresSafeArea()
                VStack (alignment: .leading ) {
                    HStack  {
                        Text("MEUS INTERESSES:")
                            .font(.title).bold()
                    }
                    .padding(.init(top: 8, leading: 32, bottom: 28, trailing: 32))
                    
                    ScrollView {
                        NavigationLink(destination: LinguagemInteresse(selectedCategory: "backend")){
                            
                            ZStack {
                                Image("backend")
                                    .resizable()
                                    .frame(width: 300, height: 115)
                                    .cornerRadius(15)
                                    .shadow(color: .gray, radius: 2, y: 2)
                                HStack{
                                    Text("BACKEND")
                                        .foregroundColor(.white)
                                        .font(.title).bold()
                                        .shadow(radius: 10)
                                        .padding(.leading, 50)
                                        .padding(.top, 70)
                                    Spacer()
                                }
                            }
                            
                            .padding(.bottom, 20)
                        }
                        
                        NavigationLink(destination: LinguagemInteresse(selectedCategory: "frontend")){
                            
                            ZStack {
                                Image("frontend")
                                    .resizable()
                                    .frame(width: 300, height: 115)
                                    .cornerRadius(15)
                                    .shadow(color: .gray, radius: 2, y: 2)
                                    .opacity(1)
                                
                                HStack {
                                    Text("FRONTEND")
                                        .foregroundColor(.white)
                                        .font(.title).bold()
                                        .shadow(radius: 10)
                                        .padding(.leading, 50)
                                        .padding(.top, 70)
                                    Spacer()
                                }
                            }
                            
                            .padding(.bottom, 20)
                        }
                        
                        NavigationLink(destination: LinguagemInteresse(selectedCategory: "mobile")){
                            
                            ZStack {
                                Image("mobile")
                                    .resizable()
                                    .frame(width: 300, height: 115)
                                    .cornerRadius(15)
                                    .shadow(color: .gray, radius: 2, y: 2)
                                
                                HStack {
                                    Text("MOBILE")
                                        .foregroundColor(.white)
                                        .font(.title).bold()
                                        .shadow(radius: 10)
                                        .padding(.leading, 50)
                                        .padding(.top, 70)
                                    Spacer()
                                }
                            }
                            
                            .padding(.bottom, 20)
                        }
                        
                        NavigationLink(destination: LinguagemInteresse(selectedCategory: "banco_de_dados")){
                            
                            ZStack {
                                Image("db")
                                    .resizable()
                                    .frame(width: 300, height: 115)
                                    .cornerRadius(15)
                                    .shadow(color: .gray, radius: 2, y: 2)
                                
                                HStack {
                                    Text("BANCO DE DADOS")
                                        .foregroundColor(.white)
                                        .font(.title).bold()
                                        .shadow(radius: 10)
                                        .padding(.leading, 50)
                                        .padding(.top, 70)
                                    Spacer()
                                }
                            }
                            
                            .padding(.bottom, 20)
                        }
                    }
                }
            }
            .onAppear {
                linguagens = viewModel.linguagens
                viewModel.fetchLinguagens()
            }
        }
    }
}



#Preview {
    Interesses()
}

