//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Maxim Gridenko on 21.08.2024.
//

import Foundation

protocol QuestionFactoryDelegate: AnyObject {
    func didReceiveNextQuestion(question: QuizQuestion?)
}
