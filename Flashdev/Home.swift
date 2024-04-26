//
//  Home.swift
//  Flashdev
//
//  Created by Turma02-20 on 18/04/24.
//

import SwiftUI

struct Home: View {
    
    @State var arrLing : [Linguagens] = []
    
    var body: some View {
        NavigationStack{
            VStack{
                VStack{
                    VStack(alignment: .leading){
                        HStack {
                            Text("HOME")
                                .font(.title).bold()
                            Spacer()
                        }
                    }
                    
                    HStack{}.frame(width: 300, height: 2).background(Color.black).cornerRadius(20).padding(.bottom)
                    NavigationLink(destination: Interesses()){
                        HStack{
                            Text("Adicione temas de estudo").font(.headline).fontWeight(.medium).foregroundStyle(.black)
                            Spacer()
                            Label("", systemImage:"plus.circle").foregroundStyle(Color.black)
                        }}}.padding(.init (top: 8, leading: 32, bottom: 8, trailing: 32))
                
                ScrollView{
                    VStack {
                        ForEach(arrLing, id:\.self) { index in
                           
                            VStack{
                                HStack{
                                    Text("\(index.linguagem)").font(.title2).foregroundStyle(Color.black).bold()
                                    Spacer()
                                }
                                
                                HStack{
                                    ZStack {
                                        AsyncImage(url: URL(string: index.imagem)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 80, height: 80)
                                            
                                        } placeholder: {
                                            ProgressView()
                                        }.clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).shadow(radius: 2, y:4)
                                    }
                                    .frame(width: 320, height: 200).background(LinearGradient(colors: [Color(index.colorDark), Color(index.colorLight)], startPoint: .leading, endPoint: .center).ignoresSafeArea())
                                    
                                }.frame(width: 320, height:200).cornerRadius(20)
                                
                                HStack{
                                    VStack (alignment: .leading){
                                        HStack{
                                            Text("FlashCards").font(.headline).foregroundStyle(Color.black)
                                            Label("", systemImage:"eye.fill")
                                        }
                                        Text("\(index.flashCardsCount)").font(.headline).foregroundStyle(Color.black).fontWeight(.bold)
                                    }
                                    .padding(.leading, 10)
                                    Spacer()
                                    VStack (alignment: .leading){
                                        HStack{
                                            Text("Desafios").font(.headline).foregroundStyle(Color.black)
                                            Label("", systemImage:"checkmark.circle.fill")
                                        }
                                        Text("\(index.desafiosCount)").font(.headline).foregroundStyle(Color.black).fontWeight(.bold)
                                    }
                                }
                            }
                        }
                        
                    }.padding(.init (top: 8, leading: 32, bottom: 8, trailing: 32))
                }
            }.onAppear(){
                arrLing=[]
                for l in Global.ling{
                    arrLing.append(l)
                    print(l)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct Global{
    static var ling : [Linguagens] = []
}
