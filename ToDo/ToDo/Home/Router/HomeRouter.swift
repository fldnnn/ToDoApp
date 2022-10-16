//
//  HomeRouter.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class HomeRouter: PresenterToRouterHomeProtocol {
    static func createModule(ref: HomeVC) {
        let presenter = HomePresenter()
        
        ref.homePresenter = presenter
        ref.homePresenter?.homeInteractor = HomeInteractor()
        ref.homePresenter?.homeView = ref
        ref.homePresenter?.homeInteractor?.homePresenter = presenter
    }
}
