//
//  AddTaskViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    var presenter: AddTaskInputView!
    
    private var addTaskUIView: AddTaskUIView {
        self.view as! AddTaskUIView
    }
    
    override func loadView() {
        view = AddTaskUIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizable.addTask()
        
        addTaskUIView.delegate = self
    }
}

extension AddTaskViewController: AddTaskUIViewDelegate {
    func addTask(note: String, priority: Priority) {
        presenter.addTask(note: note, priority: priority)
    }
}

extension AddTaskViewController: AddTaskDisplayLogic {
    func success() {
        navigationController?.popViewController(animated: true)
    }
    
    func showError(errorMessage: String) {
        DispatchQueue.main.async {
            let alert  = UIAlertController(title: R.string.localizable.errorOccurred(), message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.dismiss(), style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
}
