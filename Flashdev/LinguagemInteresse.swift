import SwiftUI

struct LinguagemInteresse: View {
    var selectedCategory: String?
    @StateObject var viewModel = ViewModel()
    @State private var isFilled = false
    @State var showingAlert = false
    //aligment: .leading
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                HStack {
                    Text("LINGUAGENS")
                        .font(.title).bold()
                    Spacer()
                }
                HStack{
                    Text("Favorite as linguagens clicando em ").font(.subheadline)
                    Image(systemName: "heart")
                }
            }.padding(.init (top: 8, leading: 32, bottom: 8, trailing: 0))
            
            HStack{}.frame(width: 300, height: 2).background(Color.black).cornerRadius(20).padding(.bottom)
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.linguagens, id: \.self) { index in
                    
                        HStack {
                            VStack(alignment: .leading){
                                HStack{
                                    Text(index.linguagem)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .fontWeight(.black)
                                        .padding(.bottom, 2)
                                    
                                    Image(systemName: "heart").onTapGesture {
                                        self.showingAlert.toggle()
                                        print(!Global.ling.contains(where: {$0 == index}))
                                              
                                        if( !Global.ling.contains(where: {$0 == index})){
                                            Global.ling.append(index)
                                        }
                                       
                                    }.font(.system(size: 20))
                                        .alert("Linguagem Favoritada", isPresented: $showingAlert) {
                                            Button("OK", role: .cancel) { }
                                        }
                                }
                                HStack {
                                    VStack (alignment: .leading){
                                        Text("FlashCards")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                        Text("\(index.flashCardsCount)")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    }
                                    .padding(.trailing, 20)
                                    
                                    VStack (alignment: .leading){
                                        Text("Desafios")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                        Text("\(index.desafiosCount)")
                                            .font(.headline)
                                            .foregroundColor(.white)
                                            .fontWeight(.bold)
                                    }
                                }
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
                            .shadow(radius: 2, y: 4)
                            
                            Spacer()
                        }
                        .frame(width: 320, height: 150)
                        .background(LinearGradient(colors: [Color(index.colorDark), Color(index.colorLight)], startPoint: .leading, endPoint: .center))
                        .cornerRadius(20)
                        
                        
                    }
                    
                }
            }//
            .padding(.horizontal, 32)
            .onAppear {
                if let category = selectedCategory {
                    viewModel.fetchLinguagensPorCategoria(for: category)
                } else {
                    viewModel.fetchLinguagens()
                }
            }
        }
    }
    
    init(selectedCategory: String?) {
        self.selectedCategory = selectedCategory
    }
}


#Preview {
    LinguagemInteresse(selectedCategory: "backend")
}
