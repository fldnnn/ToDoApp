//
//  HomeVC.swift
//  ToDo
//
//  Created by Fulden Onan on 16.10.2022.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var toDoList = [ToDoList]()
    var homePresenter: ViewToPresenterHomeProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        toDoTableView.delegate = self
        toDoTableView.dataSource = self
        
        copyDatabase()
        
        HomeRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        homePresenter?.getToDoList()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let toDo = sender as? ToDoList {
                let view = segue.destination as! ToDoUpdateVC
                view.toDo = toDo
            }
        }
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let copyPath = URL(fileURLWithPath: targetPath).appendingPathComponent("todo.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: copyPath.path) {
            print("Database has already been copied.")
        }else{
            do{
                try fileManager.copyItem(atPath: bundlePath!, toPath: copyPath.path)
            }catch{
                print(error)
            }
        }
    }
}

extension HomeVC: PresenterToViewHomeProtocol {
    func updateView(toDoList: [ToDoList]) {
        self.toDoList = toDoList
        self.toDoTableView.reloadData()
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        homePresenter?.searchToDo(searchText: searchText)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let toDo = toDoList[indexPath.row]
        let cell = toDoTableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoTableViewCell
        cell.toDoLabel.text = "\(toDo.yapilacak_is!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){(contextualAction,view,bool) in
            let toDo = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(toDo.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.homePresenter?.deleteToDo(yapilacak_id: toDo.yapilacak_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
