//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Andrew Masters on 9/17/24.
//

import SwiftUI

@main
struct TicTacToeApp: App {
    var body: some Scene {
        WindowGroup {
            TicTacToeView(model: TicTacToeModelView(theme: Themer()))
        }
    }
}
