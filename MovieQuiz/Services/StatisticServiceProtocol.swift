//
//  StatisticServiceProtocol.swift
//  MovieQuiz
//
//  Created by Maxim Gridenko on 26.08.2024.
//

import Foundation

protocol StatisticServiceProtocol {
    var gamesCount: Int { get }
    var bestGame: GameResult { get }
    var totalAccuracy: Double { get }
    
    func store(correct count: Int, total amount: Int)
}
