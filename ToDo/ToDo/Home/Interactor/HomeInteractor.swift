//
//  HomeInteractor.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class HomeInteractor: PresenterToInteractorHomeProtocol {
    
    var homePresenter: InteractorToPresenterHomeProtocol?
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        
        db = FMDatabase(path: copyPath.path)
    }
    
    func getAllToDoList() {
        var list = [ToDoList]()
        
        db?.open()
        
        do {
            let r = try db!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            
            while r.next() {
                let toDo = ToDoList(yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!, yapilacak_is: r.string(forColumn: "yapilacak_is") ?? "nil")
                list.append(toDo)
            }
            homePresenter?.didDataFetch(toDoList: list)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchToDo(searchText: String) {
        var list = [ToDoList]()
        
        db?.open()
        
        do {
            let r = try db!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(searchText)%'", values: nil)
            
            while r.next() {
                let toDo = ToDoList(yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!, yapilacak_is: r.string(forColumn: "yapilacak_is") ?? "nil")
                list.append(toDo)
            }
            homePresenter?.didDataFetch(toDoList: list)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteToDo(yapilacak_id: Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
            getAllToDoList()
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
