//
//  Theme.swift
//  TicTacToe
//
//  Created by Andrew Masters on 9/18/24.
//

import SwiftUI

protocol Theme {
    var background: any ShapeStyle { get set }
    var xs: any ShapeStyle { get set }
    var os: any ShapeStyle { get set }
    var board: any ShapeStyle { get set }
    var grid: any ShapeStyle { get set }
}

class Themer: Theme {
    var background: any ShapeStyle
    
    var xs: any ShapeStyle
    
    var os: any ShapeStyle
    
    var board: any ShapeStyle
    
    var grid: any ShapeStyle
    
    init() {
        self.background = .background
        self.xs = .background
        self.os = .background
        self.board = .gray
        self.grid = .foreground
    }
    
    func classic() {
        self.background = .background
        self.xs = .background
        self.os = .background
        self.board = .gray
        self.grid = .foreground
    }
    
    func tech() {
        
    }
    
    func fun() {
        
    }
}
