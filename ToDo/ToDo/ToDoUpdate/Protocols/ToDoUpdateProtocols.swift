//
//  ToDoUpdateProtocols.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

protocol ViewToPresenterToDoUpdateProtocol {
    var toDoUpdateInteractor: PresenterToInteractorToDoUpdateProtocol? {get set}
    
    func update(yapilacak_id: Int, yapilacak_is: String)
}

protocol PresenterToInteractorToDoUpdateProtocol {
    func updateToDo(yapilacak_id: Int, yapilacak_is: String)
}

protocol PresenterToRouterToDoUpdateProtocol {
    static func createModul(ref: ToDoUpdateVC)
}
