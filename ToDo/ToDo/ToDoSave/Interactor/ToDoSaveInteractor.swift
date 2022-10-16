//
//  ToDoSaveInteractor.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class ToDoSaveInteractor: PresenterToInteractorToDoSaveProtocol {
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        
        db = FMDatabase(path: copyPath.path)
    }
    
    func addToDo(yapilacak_is: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?) ", values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
