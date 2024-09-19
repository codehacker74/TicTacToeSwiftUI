//
//  ContentView.swift
//  TicTacToe
//
//  Created by Andrew Masters on 9/17/24.
//

/** TIC TAC TOE RULES
 1. Two people required to play, one is X's, one is O's
 2. X goes first, then O
 3. Three in a row is the winner
 4. If the board becomes filled, it's cat game and restart
 **/

import SwiftUI

struct TicTacToeView: View {
    @ObservedObject var model: TicTacToeModelView
    let boardSize = UIScreen.main.bounds.size.width
    var ticTacBoxSize: CGFloat {
        return CGFloat(self.boardSize/3)
    }
    
    init(model: TicTacToeModelView) {
        self.model = model
    }
    
    func getTicTacBox(box: Int) -> TicTacBox {
        return TicTacBox(size: self.ticTacBoxSize, box: box, model: self.model)
    }
    
    var body: some View {
        VStack {
            Text("TIC TAC TOE")
                .font(.system(size: 20, weight: .medium))
            Spacer()
            Rectangle()
                .fill(.clear)
                .frame(width: self.boardSize, height: self.boardSize, alignment: .center)
                .border(.blue, width: 2)
                .overlay(alignment: .topLeading, content: {
                    self.getTicTacBox(box: 0)
                })
                .overlay(alignment: .top, content: {
                    self.getTicTacBox(box: 1)
                })
                .overlay(alignment: .topTrailing, content: {
                    self.getTicTacBox(box: 2)
                })
                .overlay(alignment: .leading, content: {
                    self.getTicTacBox(box: 3)
                })
                .overlay(alignment: .center, content: {
                    self.getTicTacBox(box: 4)
                })
                .overlay(alignment: .trailing, content: {
                    self.getTicTacBox(box: 5)
                })
                .overlay(alignment: .bottomLeading, content: {
                    self.getTicTacBox(box: 6)
                })
                .overlay(alignment: .bottom, content: {
                    self.getTicTacBox(box: 7)
                })
                .overlay(alignment: .bottomTrailing, content: {
                    self.getTicTacBox(box: 8)
                })
                .disabled(self.model.winner != nil)
            
            Spacer()
            if self.model.winner == nil {
                Text("X's always go first")
            } else if self.model.winner == .empty {
                Text("Nobody won this round")
            } else if self.model.winner == .x {
                Text("X's WIN")
            } else if self.model.winner == .o {
                Text("O's WIN")
            }
            Button(action: {
                self.model.resetTicTacBoard()
            }, label: {
                Capsule()
                    .fill(.blue)
                    .frame(width: self.boardSize / 2, height: 40)
                    .overlay(content: {
                        Text("Start over")
                            .tint(.white)
                    })
            })
            .disabled(self.model.winner == nil)
            .opacity((self.model.winner != nil) ? 1 : 0)
        }
    }
}

struct TicTacBox: View {
    let size: CGFloat
    let box: Int
    @ObservedObject var model: TicTacToeModelView
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(.blue)
                .frame(width: self.size, height: self.size, alignment: .center)
                .border(.secondary, width: 2)
                .overlay(content: {
                    if self.model.ticTacBoard[self.box] == .x {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundStyle(.background)
                            .padding(30)
                    } else if self.model.ticTacBoard[self.box] == .o {
                        Image(systemName: "circle")
                            .resizable()
                            .foregroundStyle(.background)
                            .padding(30)
                    }
                })
                .onTapGesture {
                    model.updateBox(with: self.box)
                }
        }
    }
}

#Preview {
    TicTacToeView(model: TicTacToeModelView(theme: Themer()))
}
