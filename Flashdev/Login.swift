//
//  Login.swift
//  Flashdev
//
//  Created by Turma02-20 on 18/04/24.
//

import SwiftUI

struct Login: View {
    @State var email: String = ""
    @State var senha: String = ""
    @State private var selectedLinguagem: Linguagens?

    var linguagem: Linguagens?
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color(.white)
                
                VStack {
                    HStack {
                        Text("LOGIN")
                            .font(.title).bold()
                            .padding(.leading, 60)
                        Spacer()
                    }.padding(.top)
                    
                        .padding(.bottom, 40)
                    
                    VStack {
                        VStack {
                            HStack {
                                Text("E-mail: ")
                                    .padding(.leading, 63)
                                Spacer()
                            }
                            TextField("", text: $email)
                                .frame(width: 250, height: 50)
                                .overlay (
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.azul))
                                .padding(.bottom, 25)
                        }
                        HStack {
                            Text("Senha:  ")
                                .padding(.leading, 63 )
                            Spacer()
                        }
                        TextField("", text: $senha)
                            .frame(width: 250, height: 50)
                            .overlay (
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.azul))
                            .padding(.bottom, 30)
                        NavigationLink(destination: ContentView()) {
                            Text("Entrar")
                                .foregroundStyle(.black)
                                .frame(width: 180, height: 60)
                                .background(Color.azul)
                                .foregroundStyle(.azul)
                                .bold()
                                .cornerRadius(10)
                        }
                        }
                        Spacer()
                    }
                }
            }
        }
}

#Preview {
    Login()
}

