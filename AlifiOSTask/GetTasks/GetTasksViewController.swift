//
//  GetTasksViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class GetTasksViewController: UIViewController {
    
    var presenter: GetAllTasksInputView!
    
    private var getTaskskUIView: GetTasksUIView {
        self.view as! GetTasksUIView
    }
    
    override func loadView() {
        view = GetTasksUIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizable.appName()
    
        getTaskskUIView.delegate = self
        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getAllTasks()
    }
    
    private func configureNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(addToDo))
    }
    
    @objc private func addToDo() {
        let addTaskVC = AddTaskAssembly.configureModule()
        navigationController?.pushViewController(addTaskVC, animated: true)
    }
}

extension GetTasksViewController: GetTasksUIViewDelegate {
    func deleteTask(task: Task) {
        presenter.deleteTask(task: task)
    }
    
    func taskTapped(task: Task) {
        let editVC = EditTaskAssembly.configureModule(task: task)
        navigationController?.pushViewController(editVC, animated: true)
    }
}

extension GetTasksViewController: GetAllTasksDislplayLogic {
    func success(user: UserViewModel) {
        DispatchQueue.main.async {
            self.getTaskskUIView.setupData(data: user.tasks)
        }
    }
    
    func success() {
        presenter.getAllTasks()
    }
    
    func showError(errorMessage: String) {
        DispatchQueue.main.async {
            let alert  = UIAlertController(title: R.string.localizable.errorOccurred(), message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.dismiss(), style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
