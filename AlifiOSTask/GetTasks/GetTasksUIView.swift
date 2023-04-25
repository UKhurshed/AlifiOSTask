//
//  ToDoListUIView.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit
import SnapKit
import RealmSwift

protocol GetTasksUIViewDelegate: AnyObject {
    func deleteTask(task: Task)
    func taskTapped(task: Task)
}

class GetTasksUIView: UIView {
    
    private let tableView = UITableView()
    private let noDataImage = UIImageView()
    
    private var result = [Task]()
    
    weak var delegate: GetTasksUIViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initTableView()
        initNoDataImage()
    }
    
    private func initTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ToDoTableViewCell.self, forCellReuseIdentifier: ToDoTableViewCell.identifier)
        
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func initNoDataImage() {
        noDataImage.translatesAutoresizingMaskIntoConstraints = false
        noDataImage.isHidden = true
        noDataImage.contentMode = .scaleAspectFit
        noDataImage.image = R.image.noData()
        
        addSubview(noDataImage)
        noDataImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(data: [Task]) {
        if data.isEmpty {
            tableView.isHidden = true
            noDataImage.isHidden = false
        } else {
            self.result = data
            tableView.isHidden = false
            noDataImage.isHidden = true
            tableView.reloadData()
        }

    }
}

extension GetTasksUIView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as! ToDoTableViewCell
        cell.setupData(task: result[indexPath.row])
        return cell
    }
}

extension GetTasksUIView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        delegate?.taskTapped(task: self.result[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: R.string.localizable.delete()) { _, _, _ in
            self.delegate?.deleteTask(task: self.result[indexPath.row])
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
