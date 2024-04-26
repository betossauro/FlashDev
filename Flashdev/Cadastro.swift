//
//  Cadastro.swift
//  Flashdev
//
//  Created by Turma02-20 on 18/04/24.
//

import SwiftUI

struct Cadastro: View {
    @State var nome: String = ""
    @State var email: String = ""
    @State var senha: String = ""
    @State var iEnsino: String = ""
    
    var body: some View {
            ZStack {
                Color(.white)
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("CADASTRO")
                            .font(.title).bold()
                    }
                    .padding(.init(.init(top: 0, leading: 60, bottom: 40, trailing: 0)))
                    
                    VStack {
                        HStack {
                            Text("Nome: ")
                                .padding(.leading, 63)
                            Spacer()
                            
                        }
                        TextField("", text: $nome)
                            .frame(width: 250, height: 50)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.azul))
                            .padding(.bottom, 25)
                        
                        HStack {
                            Text("E-mail:  ")
                                .padding(.leading, 63 )
                            Spacer()
                        }
                        TextField("", text: $email)
                            .frame(width: 250, height: 50)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.azul))
                            .padding(.bottom, 25)
                        
                        HStack {
                            Text("Instituição de ensino:")
                                .padding(.leading, 63 )
                            Spacer()
                        }
                        TextField("", text: $iEnsino)
                            .frame(width: 250, height: 50)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.azul))
                            .padding(.bottom, 25)
                        
                        HStack {
                            Text("Senha: ")
                                .padding(.leading, 63)
                            Spacer()
                        }
                        TextField("", text: $senha)
                            .frame(width: 250, height: 50)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.azul))
                            .padding(.bottom, 30)
                        
                        NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                            Text("Cadastrar")
                                .foregroundStyle(.black)
                                .frame(width: 180, height: 60)
                                .background(Color.azul)
                                .foregroundStyle(.azul)
                                .bold()
                                .cornerRadius(10)
                        }
                    }
                }
            
        }
    }
}

#Preview {
    Cadastro()
}

