//
//  ToDoUpdatePresenter.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class ToDoUpdatePresenter: ViewToPresenterToDoUpdateProtocol {
    var toDoUpdateInteractor: PresenterToInteractorToDoUpdateProtocol?

    
    func update(yapilacak_id: Int, yapilacak_is: String) {
        toDoUpdateInteractor?.updateToDo(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}
