//
//  HomePresenter.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class HomePresenter: ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol?
    
    var homeView: PresenterToViewHomeProtocol?
    
    func getToDoList() {
        homeInteractor?.getAllToDoList()
    }
    
    func searchToDo(searchText: String) {
        homeInteractor?.searchToDo(searchText: searchText)
    }
    
    func deleteToDo(yapilacak_id: Int) {
        homeInteractor?.deleteToDo(yapilacak_id: yapilacak_id)
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func didDataFetch(toDoList: [ToDoList]) {
        homeView?.updateView(toDoList: toDoList)
    }
}
