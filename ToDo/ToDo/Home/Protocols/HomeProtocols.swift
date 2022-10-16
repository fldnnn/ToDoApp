//
//  HomeProtocols.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

protocol ViewToPresenterHomeProtocol {
    var homeInteractor: PresenterToInteractorHomeProtocol? {get set}
    var homeView: PresenterToViewHomeProtocol? {get set}
    
    func getToDoList()
    func searchToDo(searchText: String)
    func deleteToDo(yapilacak_id: Int)
}

protocol PresenterToInteractorHomeProtocol {
    var homePresenter: InteractorToPresenterHomeProtocol? {get set}
    
    func getAllToDoList()
    func searchToDo(searchText: String)
    func deleteToDo(yapilacak_id: Int)
}

protocol InteractorToPresenterHomeProtocol {
    func didDataFetch(toDoList: [ToDoList])
}

protocol PresenterToViewHomeProtocol{
    func updateView(toDoList: [ToDoList])
}

protocol PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeVC)
}
