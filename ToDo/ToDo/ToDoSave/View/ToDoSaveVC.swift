//
//  ToDoSaveVC.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import UIKit

class ToDoSaveVC: UIViewController {

    @IBOutlet weak var tfYapilacakIs: UITextField!
    
    var toDoSavePresenter: ViewToPresenterToDoSaveProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ToDoSaveRouter.createModule(ref: self)

        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let tf = tfYapilacakIs.text {
            toDoSavePresenter?.add(yapilacak_is: tf)
        }
    }
    
}
