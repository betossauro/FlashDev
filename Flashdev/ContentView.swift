import SwiftUI

struct ContentView: View {
    var viewModel: ViewModel?
    @State private var selectedLinguagem: Linguagens?
    @State private var linguagens: [Linguagens] = []
    
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Label("Inicio", systemImage: "house.fill" )
                }
            
            MenuFlashCard()
                .tabItem {
                    Label("Flash Cards", systemImage: "menucard.fill" )
                }
            MenuDesafio()
                .tabItem {
                    Label("Desafios", systemImage: "brain.fill" )
                }
            Perfil()
                .tabItem {
                    Label("Perfil", systemImage: "person.fill" ) .foregroundStyle(Color.black)
                }
        }.accentColor(Color.icon)
    }
}

#Preview {
    ContentView()
}
