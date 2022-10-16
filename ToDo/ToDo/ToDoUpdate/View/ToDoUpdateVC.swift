//
//  ToDoUpdateVC.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import UIKit

class ToDoUpdateVC: UIViewController {

    @IBOutlet weak var tfYapilacakIs: UITextField!
    
    var toDo: ToDoList?
    
    var toDoUpdatePresenter: ViewToPresenterToDoUpdateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let t = toDo {
            tfYapilacakIs.text = t.yapilacak_is
        }
    }

    @IBAction func updateButton(_ sender: Any) {
        if let td = tfYapilacakIs, let t = toDo {
            toDoUpdatePresenter?.update(yapilacak_id: t.yapilacak_id!, yapilacak_is: td)
        }
    }
}
