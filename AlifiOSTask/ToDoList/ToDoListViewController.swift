//
//  ToDoListViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class ToDoListViewController: UIViewController {
    
    private var toDoListUIView: ToDoListUIView {
        self.view as! ToDoListUIView
    }
    
    override func loadView() {
        view = ToDoListUIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "To Do List"
       
        configureNavBar()
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addToDo))
    }
    
    @objc private func addToDo() {
        let alert = UIAlertController(title: "To Do", message: "Add new task", preferredStyle: .alert)
        alert.addTextField { _ in
            
        }
        
        let save = UIAlertAction(title: "Save", style: .default) { action in
            let field = alert.textFields?.first
            if let newTask = field?.text {
                DispatchQueue.main.async {
                    self.toDoListUIView.setupData(data: newTask)
                }
                
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(save)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
}
