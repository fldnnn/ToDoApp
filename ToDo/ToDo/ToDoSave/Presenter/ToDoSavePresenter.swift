//
//  ToDoSavePresenter.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class ToDoSavePresenter: ViewToPresenterToDoSaveProtocol {
    var toDoSaveInteractor: PresenterToInteractorToDoSaveProtocol?
    
    func add(yapilacak_is: String) {
        toDoSaveInteractor?.addToDo(yapilacak_is: yapilacak_is)
    }
}
