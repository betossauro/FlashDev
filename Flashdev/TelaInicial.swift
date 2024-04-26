import SwiftUI

struct TelaInicial: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("FLASHDEV").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                }
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                }.frame(width: 150, height:150)
                HStack{
                    Text("PRATIQUE SEUS CONHECIMENTOS DE PROGRAMAÇÃO ").font(.subheadline)
                        .fontWeight(.bold).multilineTextAlignment(.center)
                }.frame(width: 230,height: 150)
                VStack{
                    NavigationLink(destination: EscolhaPerfil()){
                        HStack{
                            Text("Comece agora").bold().foregroundStyle(Color.black)
                            Label("", systemImage:"arrow.right").foregroundStyle(Color.black)
                        }.frame(width: 200,height: 60).background(.azul).cornerRadius(10)
                            .padding()
                    }
                    NavigationLink(destination: Login()){
                        HStack{
                            Text("Fazer login").bold().foregroundStyle(Color.black)
                            Label("", systemImage:"arrow.right").foregroundStyle(Color.black)
                        }.frame(width: 200,height: 60).background(.azul).cornerRadius(10)
                    }
                }
            }.padding()
        }
    }
}

#Preview {
    TelaInicial()
}
