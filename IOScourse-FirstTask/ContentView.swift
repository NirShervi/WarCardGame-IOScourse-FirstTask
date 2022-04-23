//
//  ContentView.swift
//  IOScourse-FirstTask
//
//  Created by Nir Shervi on 20/04/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard : String = "generic-card"
    @State var cpuCard : String = "generic-card"
    @State var title : String = "Games"
    @State var button : String = "play-button"
    @State var playerScore : Int = 0
    @State var cpuScore : Int = 0
    @State var turns : Int = 0
    
    
    var body: some View {
        
        
        ZStack{
            Image("backgroundAppPink").resizable().ignoresSafeArea()
// first horizontal view
            VStack{
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Image("player")
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0).padding()
                    Text("Player")
                    }
                    Spacer()
                    // game zone
                    HStack{
                        Image(playerCard)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                        Button(action: {
                            initRestart()
                            
                            
                            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                                startGame()
                                if (turns == 20){
                                    initafterGame()
                                    timer.invalidate()
                                }
                
                            }
                                        
                }, label: {Image(button).resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50.0, height: 50.0)})
                            
                            
                        Image(cpuCard)
                            .resizable(resizingMode: .stretch)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100.0, height: 100.0)
                            
                    }
                    // end game zone
                    Spacer()
                    
                    // cpu player
                        VStack{
                            Image("player").resizable().aspectRatio(contentMode: .fit).frame(width: 100.0, height: 100.0).fixedSize().padding()
                            Text("CPU")
                        }
                    // end cpu player
                    Spacer()
                }
                Spacer()
                // start hstack
                HStack {
                    Spacer()
                    VStack{
                        Text("Score:")
                            
                        Text(String(playerScore))
                    }
                    Spacer()
                    VStack{
                        Text(title)
                            
                        Text("\(String(turns))/20")
                    }
                    Spacer()
                    VStack{
                        Text("Score:")
                        Text(String(cpuScore))
                    }
                        Spacer()
                }
                Spacer()
            }
            // end first Vstack
            
            
            
        }
        // Zstack
    }
    
    func startGame(){
        
        let playerRand = Int.random(in: 1...10)
        let cpuRand = Int.random(in: 1...10)
       
        playerCard = "\(String(playerRand))-of-hearts"
        cpuCard = "\(String(cpuRand))-of-spades"
       print(" Player number  : \(playerRand) , CPU number : \(cpuRand)")
       if playerRand > cpuRand {
               playerScore = playerScore + 1
       }
       else if cpuRand > playerRand {
               cpuScore = cpuScore + 1
       }
        
        turns = turns + 1
        
    }
    
    
    
    func initafterGame() {
        
        print ( " player score : \(playerScore) cpu score : \(cpuScore)")
            if playerScore > cpuScore{
                title = "You Won !"
            }
            else if cpuScore > playerScore {
                title = "You Lost !"
            }
            else {
                title = "Its a Tie !"
            }
        
        button = "restart-button"
        
        playerCard  = "generic-card"
        cpuCard  = "generic-card"
        button  = "restart-button"
        
    }
    
    func initRestart(){
        title  = "Games"
        playerScore = 0
        cpuScore  = 0
        turns = 0
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

