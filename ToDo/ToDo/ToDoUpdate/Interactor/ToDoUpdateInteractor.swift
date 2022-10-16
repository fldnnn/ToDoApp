//
//  ToDoUpdateInteractor.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import Foundation

class ToDoUpdateInteractor {
    
    let db: FMDatabase?
    
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        
        db = FMDatabase(path: copyPath.path)
    }
    
    
    
    func updateToDo(yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE yapilacaklar SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is, yapilacak_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
