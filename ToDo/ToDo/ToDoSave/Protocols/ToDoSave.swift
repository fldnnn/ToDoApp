//
//  ToDoSave.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

protocol ViewToPresenterToDoSaveProtocol {
    var toDoSaveInteractor: PresenterToInteractorToDoSaveProtocol? {get set}
    
    func add(yapilacak_is: String)
}

protocol PresenterToInteractorToDoSaveProtocol {
    func addToDo(yapilacak_is: String)
}

protocol PresenterToRouterToDoSaveProtocol {
    static func createModule(ref: ToDoSaveVC)
}
