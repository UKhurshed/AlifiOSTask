//
//  EditTaskViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    private let task: Task
    
    var presenter: EditTaskInputView!
    
    init(task: Task) {
        self.task = task
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var editTaskUIView: EditTaskUIView {
        self.view as! EditTaskUIView
    }
    
    override func loadView() {
        view = EditTaskUIView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = R.string.localizable.editTask()
        
        editTaskUIView.delegate = self
        editTaskUIView.setupData(task: self.task)
    }
}

extension EditTaskViewController: EditTaskUIViewDelegate {
    func edit(note: String, priority: Priority) {
        presenter.editTask(editTaskModel: EditTaskModel(id: self.task.id.stringValue, note: note, priority: priority))
    }
}

extension EditTaskViewController: EditTaskDisplayLogic {
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
