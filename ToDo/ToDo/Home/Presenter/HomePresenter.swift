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
        
    }
    
    func deleteToDo(yapilacak_id: Int) {
        
    }
}

extension HomePresenter: InteractorToPresenterHomeProtocol {
    func didDataFetch(toDoList: [ToDoList]) {
        homeView?.updateView(toDoList: toDoList)
    }
}
