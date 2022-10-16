//
//  ToDoUpdateRouter.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class ToDoUpdateRouter: PresenterToRouterToDoUpdateProtocol {
    static func createModul(ref: ToDoUpdateVC) {
        ref.toDoUpdatePresenter = ToDoUpdatePresenter()
        ref.toDoUpdatePresenter?.toDoUpdateInteractor = ToDoUpdateInteractor()
        
    }
}
