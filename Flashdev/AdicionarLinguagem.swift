//
//  AdicionarLinguagem.swift
//  Flashdev
//
//  Created by Turma02-20 on 18/04/24.
//

import SwiftUI

//apagar
struct AdicionarLinguagem: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading){
                HStack {
                    Text("LINGUAGENS")
                        .font(.title).bold()
                    Spacer()
                }
                HStack{
                    Text("Linguagens de programação").font(.subheadline)
                }
            }.padding(.init (top: 8, leading: 32, bottom: 8, trailing: 0))
            
            HStack{}.frame(width: 300, height: 2).background(Color.black).cornerRadius(20).padding(.bottom)
            
            
            ScrollView{
                VStack (alignment: .leading){
                    //  ForEach() { index in
                    //      NavigationLink(destination: (: index)){
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Swift UI").font(.title2).foregroundStyle(Color.white).fontWeight(.black).padding(.init(top: 0, leading: 0, bottom: 2, trailing: 0))
                            HStack{
                                Text("Progresso: ").font(.title3).foregroundStyle(Color.white)
                                Text("{VALOR}").font(.title3).foregroundStyle(Color.white).bold()
                            }
                            HStack {
                                VStack (alignment: .leading){
                                    Text("FlashCards").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                    Text("{VALOR}").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                }.padding(.init(top: 2, leading: 2, bottom: 2, trailing: 20))
                                VStack (alignment: .leading){
                                    Text("Desafios").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                    Text("{VALOR}").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                }
                            }
                        }.padding()
                        Spacer()
                        VStack{
                            AsyncImage(url: URL(string: "https://blog.avenuecode.com/hubfs/banner-2.jpg#keepProtocol")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                            } placeholder: {
                                ProgressView()
                            }
                        }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).shadow(radius: 4, y:4)
                        //.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 12))
                        Spacer()
                    }.frame(width: 320, height:150)
                        .background(LinearGradient(colors: [.black, .blue], startPoint: .leading, endPoint: .center
                                                  ).ignoresSafeArea()).cornerRadius(20)
                }
            }
        }
    }
}

#Preview {
    AdicionarLinguagem()
}
