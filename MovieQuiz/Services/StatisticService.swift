//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Maxim Gridenko on 26.08.2024.
//

import Foundation


final class StatisticService: StatisticServiceProtocol {
    private let storage: UserDefaults = .standard
    
    private var correctAnswers: Int {
        get {
            return storage.integer(forKey: Keys.correctAnswers.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.correctAnswers.rawValue)
        }
    }
    
    private enum Keys: String {
        case bestGameCorrect
        case bestGameTotal
        case bestGameDate
        case gamesCount
        case correctAnswers
    }
    
    var gamesCount: Int {
        get {
            return storage.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            storage.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    var bestGame: GameResult {
        get {
            let correct = storage.integer(forKey: Keys.bestGameCorrect.rawValue)
            let total = storage.integer(forKey: Keys.bestGameTotal.rawValue)
            let date = storage.object(forKey: Keys.bestGameDate.rawValue) as? Date ?? Date()
            
            return GameResult(correct: correct, total: total, date: date)
        }
        set {
            let currentBestGame = bestGame
            if newValue.isBetterThan(currentBestGame) {
                storage.set(newValue.correct, forKey: Keys.bestGameCorrect.rawValue)
                storage.set(newValue.total, forKey: Keys.bestGameTotal.rawValue)
                storage.set(newValue.date, forKey: Keys.bestGameDate.rawValue)
            }
        }
    }
    var totalAccuracy: Double {
        let totalQuestionsKey = "totalQuestions"
        let totalQuestions = storage.integer(forKey: totalQuestionsKey)
        guard totalQuestions > 0 else { return 0.0 }
        
        return Double(correctAnswers) / Double(totalQuestions) * 100.0
    }
    
    func store(correct count: Int, total amount: Int) {
        
    }
  
}
