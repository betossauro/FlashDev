
import SwiftUI

struct EscolhaPerfil: View {
    var body: some View {
        
            ZStack {
                Color(.white).ignoresSafeArea()
                
                VStack  (alignment: .leading ){
                    HStack {
                        
                        Text("VOCÊ É: ")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.leading, 20)
                    } .padding()
                    
                    VStack {
                        HStack {
                            Text("ALUNO")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 35)
                            Spacer()
                        }
                        NavigationLink(destination: Cadastro()) {
                            Image("aluno")
                                .resizable()
                                .frame(width: 300, height: 200)
                                .cornerRadius(15)
                                .shadow(color: .gray, radius: 2, y: 2)
                               
                        }
                    }
                    
                    .padding(.bottom, 40)
                    VStack {
                        HStack {
                            Text("PROFESSOR")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.leading, 35)
                            
                            Spacer()
                        }
                        
                        NavigationLink(destination: Cadastro()) {
                            Image("prof")
                                .resizable()
                                .frame(width: 300, height: 200)
                                .cornerRadius(15)
                                .shadow(color: .gray, radius: 2, y: 2)
                             
                                
                        }
                        Spacer()
                    }
                    
                }
            }
           
            
            
            
            
        
    }
}

#Preview {
    EscolhaPerfil()
}

