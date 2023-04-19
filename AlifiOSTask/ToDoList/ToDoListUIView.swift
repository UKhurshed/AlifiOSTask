//
//  ToDoListUIView.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit
import SnapKit
import RealmSwift

class ToDoListUIView: UIView {
    
    private let tableView = UITableView()
    
    private var result = [String]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initTableView()
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

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(data: String) {
        self.result.append(data)
        tableView.reloadData()
    }
}

extension ToDoListUIView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToDoTableViewCell.identifier, for: indexPath) as! ToDoTableViewCell
        cell.textLabel?.text = result[indexPath.row]
        return cell
    }
}

extension ToDoListUIView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
