//
//  TicTacToeModelView.swift
//  TicTacToe
//
//  Created by Andrew Masters on 9/17/24.
//

import SwiftUI

enum TicTacBoxType {
    case o
    case x
    case empty
}

class TicTacToeModelView: ObservableObject {
    @Published var ticTacBoard: [TicTacBoxType] = []
    @Published var winner: TicTacBoxType? = nil
    @Published var theme: Theme
    
    var isX: Bool = true
    private var newBoard: [TicTacBoxType] = [
        .empty, .empty, .empty,
        .empty, .empty, .empty,
        .empty, .empty, .empty
    ]
    
    init(theme: Theme) {
        self.theme = theme
        self.resetTicTacBoard()
    }
    
    func resetTicTacBoard() {
        self.ticTacBoard = self.newBoard
        self.isX = true
        self.winner = nil
    }
    
    func boardIsFilled() -> Bool {
        for ticTacBox in ticTacBoard {
            if ticTacBox == .empty {
                return false
            }
        }
        return true
    }
    
    func updateBox(with box: Int) {
        guard self.ticTacBoard[box] == .empty else { return }
        self.ticTacBoard[box] = self.isX ? .x : .o
        self.isX.toggle()
        self.checkIfGameOver()
    }
    
    private func checkIfGameOver() {
        if let threeInARow = self.threeInARow() {
            self.winner = threeInARow
        } else if boardIsFilled() {
            self.winner = .empty
        }
    }
    
    private func threeInARow() -> TicTacBoxType? {
        if self.ticTacBoard[0] != .empty && self.ticTacBoard[0] == self.ticTacBoard[1] && self.ticTacBoard[0] == self.ticTacBoard[2] {
            return self.ticTacBoard[0]
        }
        if self.ticTacBoard[0] != .empty && self.ticTacBoard[0] == self.ticTacBoard[4] && self.ticTacBoard[4] == self.ticTacBoard[8] {
            return self.ticTacBoard[0]
        }
        if self.ticTacBoard[0] != .empty && self.ticTacBoard[0] == self.ticTacBoard[3] && self.ticTacBoard[3] == self.ticTacBoard[6] {
            return self.ticTacBoard[0]
        }
        if self.ticTacBoard[1] != .empty && self.ticTacBoard[1] == self.ticTacBoard[4] && self.ticTacBoard[4] == self.ticTacBoard[7] {
            return self.ticTacBoard[1]
        }
        if self.ticTacBoard[2] != .empty && self.ticTacBoard[2] == self.ticTacBoard[5] && self.ticTacBoard[5] == self.ticTacBoard[8] {
            return self.ticTacBoard[2]
        }
        if self.ticTacBoard[2] != .empty && self.ticTacBoard[2] == self.ticTacBoard[4] && self.ticTacBoard[4] == self.ticTacBoard[6] {
            return self.ticTacBoard[2]
        }
        if self.ticTacBoard[3] != .empty && self.ticTacBoard[3] == self.ticTacBoard[4] && self.ticTacBoard[4] == self.ticTacBoard[5] {
            return self.ticTacBoard[3]
        }
        if self.ticTacBoard[6] != .empty && self.ticTacBoard[6] == self.ticTacBoard[7] && self.ticTacBoard[7] == self.ticTacBoard[8] {
            return self.ticTacBoard[6]
        }
        return nil
    }
    
}
