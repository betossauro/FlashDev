//
//  MenuFlashCard.swift
//  Flashdev
//
//  Created by Turma02-20 on 18/04/24.
//

import SwiftUI

struct MenuFlashCard: View {
    @State var arrLing : [Linguagens] = []
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack(alignment: .leading){
                    HStack {
                        Text("FLASH CARDS")
                            .font(.title).bold()
                        Spacer()
                    }
                    HStack{
                        Text("Obtenha conhecimentos").font(.subheadline)
                    }
                }.padding(.init (top: 8, leading: 32, bottom: 8, trailing: 0))
                
                HStack{}.frame(width: 300, height: 2).background(Color.black).cornerRadius(20).padding(.bottom)
                
                
                ScrollView{
                    VStack (alignment: .leading){
                        
                        ForEach(arrLing, id:\.self) {  index in
                            NavigationLink(destination: FlashCard(pLinguagem: index)){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("\(index.linguagem)").font(.title2).foregroundStyle(Color.white).fontWeight(.black).padding(.init(top: 0, leading: 0, bottom: 2, trailing: 0))
                                        
                                        HStack {
                                            VStack (alignment: .leading){
                                                Text("FlashCards").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                                Text("\(index.flashCardsCount)").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                            }.padding(.init(top: 2, leading: 2, bottom: 2, trailing: 20))
                                            VStack (alignment: .leading){
                                                Text("Desafios").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                                Text("\(index.desafiosCount)").font(.headline).foregroundStyle(Color.white).fontWeight(.bold)
                                            }
                                        }
                                    }.padding()
                                    Spacer()
                                    VStack{
                                        AsyncImage(url: URL(string: index.imagem)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 60, height: 60)
                                        } placeholder: {
                                            ProgressView()
                                        }
                                    }.clipShape(Circle()).shadow(radius: 4, y:4)
                                    
                                    Spacer()
                                }.frame(width: 320, height:150)
                                    .background(LinearGradient(colors: [Color(index.colorDark), Color(index.colorLight)], startPoint: .leading, endPoint: .center
                                                              ).ignoresSafeArea()).cornerRadius(20)
                            }
                        }
                    }
                }
            }.onAppear(){
                arrLing=[]
                for l in Global.ling{
                    arrLing.append(l)
                    print(l)
                }
            } 
        }
    }
}

#Preview {
    MenuFlashCard()
}

