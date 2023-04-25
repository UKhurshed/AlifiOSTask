//
//  ToDoTableViewCell.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    static let identifier = "UsersTableViewCell"
    
    private let note = UILabel()
    private let priorityIndicator = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initNote()
        initPriorityIndicator()
    }
    
    private func initNote() {
        note.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(note)
        note.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.centerY.equalToSuperview()
        }
    }
    
    private func initPriorityIndicator() {
        priorityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(priorityIndicator)
        priorityIndicator.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(10)
        }
        
        priorityIndicator.layer.cornerRadius = 0.5 * 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(task: Task) {
        note.text = task.note
        priorityIndicator.backgroundColor = task.priority.priorityColor()
    }
    
}
