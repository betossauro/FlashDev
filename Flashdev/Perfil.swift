//
//  Perfil.swift
//  Flashdev
//
//  Created by Turma02-20 on 18/04/24.
//

import SwiftUI

struct Perfil: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .center){
                HStack {
                    Text("PERFIL")
                        .font(.title).bold()
                    Spacer()
                }.padding(.init(top: 0, leading: 32, bottom: 40, trailing: 0))
                VStack{
                    HStack{
                        Image("maria")
                            .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                        }
                    }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).shadow(radius: 4, y:4)
                    HStack{
                        Text("Maria")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.title2)
                    }
                }.padding(.init(top: 0, leading: 0, bottom: 40, trailing: 0))
                
                HStack{
                    Text("Alterar email").font(.subheadline).bold()
                }.frame(width: 200,height: 60).background(.azul).cornerRadius(10)
                HStack{
                    Text("Alterar senha").font(.subheadline).bold()
                }.frame(width: 200,height: 60).background(.azul).cornerRadius(10)
                Spacer()
                HStack{
                    Text("Sair").font(.subheadline).bold()
                        .padding()
                    Label("", systemImage:"rectangle.portrait.and.arrow.forward").foregroundStyle(Color.black)
                }.frame(width: 200,height: 60).background(.vermelho).cornerRadius(10)
                Spacer()
            }.padding()
        }
    }


#Preview {
    Perfil()
}
