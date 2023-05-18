//
//  ContentView.swift
//  MyJanken
//
//  Created by 中嶋真太郎 on 2023/05/18.
//

import SwiftUI

struct ContentView: View {
    @State var answerNumber = 0
    @State var MyAnswerNumber = 0
    @State var resultJanken = ""
    var body: some View {
        VStack {
            if answerNumber != 0{
                Button{
                    answerNumber = 0
                    resultJanken = ""
                }label: {
                    Text("スタートに戻る")
                }
            }
            
            Text(resultJanken)
            Spacer()
            
            if answerNumber == 0{
                Text("これからじゃんけんをします！")
                    .padding(.bottom)
            } else if answerNumber == 1{
                Image("gu")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("グー")
                    .padding(.bottom)
            } else if answerNumber == 2{
                Image("choki")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("チョキ")
                    .padding(.bottom)
            }else{
                Image("pa")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("パー")
                    .padding(.bottom)
            }
            Text("じゃんけんをする")
                .frame(maxWidth: .infinity)
                .frame(height:75)
                .font(.title)
                .background(Color.green)
                .foregroundColor(Color.white)
            
            HStack{
                Button {
                    checkResult(myAnswer:1)
                } label: {
                    Text("グー")
                        .frame(maxWidth: .infinity)
                        .frame(height:50)
                        .font(.title)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                }
                Button {
                    checkResult(myAnswer:2)
                } label: {
                    Text("チョキ")
                        .frame(maxWidth: .infinity)
                        .frame(height:50)
                        .font(.title)
                        .background(Color.yellow)
                        .foregroundColor(Color.white)
                }
                Button {
                    checkResult(myAnswer:3)
                } label: {
                    Text("パー")
                        .frame(maxWidth: .infinity)
                        .frame(height:50)
                        .font(.title)
                        .background(Color.red)
                        .foregroundColor(Color.white)
                }
            }
        }
    }
    
    func checkResult(myAnswer: Int){
        var newAnswerNumber = 0
        repeat{
            newAnswerNumber = Int.random(in: 1...3)
        }while answerNumber == newAnswerNumber
        
        answerNumber = newAnswerNumber
        
        if myAnswer == answerNumber{
            resultJanken = "引き分け"
        }else{
            if myAnswer == 1 {
                if answerNumber == 2{
                    resultJanken = "勝ち"
                }else if answerNumber == 3 {
                    resultJanken = "負け"
                }
            }else if myAnswer == 2 {
                if answerNumber == 1{
                    resultJanken = "負け"
                }else if answerNumber == 3{
                    resultJanken = "勝ち"
                }
            }else if myAnswer == 3 {
                if answerNumber == 1{
                    resultJanken = "勝ち"
                }else if answerNumber == 2{
                    resultJanken = "負け"
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
