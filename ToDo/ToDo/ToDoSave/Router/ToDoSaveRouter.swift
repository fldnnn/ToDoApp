//
//  ToDoSaveRouter.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class ToDoSaveRouter: PresenterToRouterToDoSaveProtocol {
    static func createModule(ref: ToDoSaveVC) {
        ref.toDoSavePresenter = ToDoSavePresenter()
        ref.toDoSavePresenter?.toDoSaveInteractor = ToDoSaveInteractor()
    }
}
