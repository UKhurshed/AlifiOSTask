//
//  AddTaskUIView.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 25.04.2023.
//

import UIKit

protocol AddTaskUIViewDelegate: AnyObject {
    func addTask(note: String, priority: Priority)
}

class AddTaskUIView: UIView {
    
    private let textField = UITextField()
    private let priorityLabel = UILabel()
    private let highBtn = UIButton()
    private let normalBtn = UIButton()
    private let lowBtn = UIButton()
    private let addTaskBtn = UIButton()
    
    private var priority: Priority = .normal
    
    weak var delegate: AddTaskUIViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initTextField()
        initPriorityLabel()
        initHighBtn()
        initNormalBtn()
        initLowBtn()
        initAddTaskBtn()
    }
    
    private func initTextField() {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray6
        textField.placeholder = R.string.localizable.textFieldDescription()
        textField.becomeFirstResponder()
        
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.textField.frame.height))
        textField.leftView = padding
        textField.leftViewMode = .always
        
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
    }
    
    private func initPriorityLabel() {
        priorityLabel.translatesAutoresizingMaskIntoConstraints = false
        priorityLabel.text = R.string.localizable.priority()
        priorityLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        
        addSubview(priorityLabel)
        priorityLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    private func initHighBtn() {
        highBtn.translatesAutoresizingMaskIntoConstraints = false
        highBtn.setTitle(R.string.localizable.high(), for: .normal)
        highBtn.backgroundColor = highBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        highBtn.layer.cornerRadius = 10
        highBtn.addTarget(self, action: #selector(highTapped), for: .touchUpInside)
        
        addSubview(highBtn)
        highBtn.snp.makeConstraints { make in
            make.top.equalTo(priorityLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(15)
            make.height.equalTo(45)
            make.width.equalTo(60)
        }
    }
    
    @objc private func highTapped() {
        priority = .high
        highBtn.backgroundColor = highBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        normalBtn.backgroundColor = normalBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        lowBtn.backgroundColor = lowBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        addTaskBtn.backgroundColor = priority.priorityColor()
    }
    
    private func initNormalBtn() {
        normalBtn.translatesAutoresizingMaskIntoConstraints = false
        normalBtn.setTitle(R.string.localizable.normal(), for: .normal)
        normalBtn.backgroundColor = normalBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        normalBtn.layer.cornerRadius = 10
        normalBtn.addTarget(self, action: #selector(normalTapped), for: .touchUpInside)
        
        addSubview(normalBtn)
        normalBtn.snp.makeConstraints { make in
            make.top.equalTo(priorityLabel.snp.bottom).offset(15)
            make.leading.equalTo(highBtn.snp.trailing).offset(15)
            make.height.equalTo(45)
            make.width.equalTo(90)
        }
    }
    
    @objc private func normalTapped() {
        priority = .normal
        normalBtn.backgroundColor = normalBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        highBtn.backgroundColor = highBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        lowBtn.backgroundColor = lowBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        addTaskBtn.backgroundColor = priority.priorityColor()
    }
    
    private func initLowBtn() {
        lowBtn.translatesAutoresizingMaskIntoConstraints = false
        lowBtn.setTitle(R.string.localizable.low(), for: .normal)
        lowBtn.backgroundColor = lowBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        lowBtn.layer.cornerRadius = 10
        lowBtn.addTarget(self, action: #selector(lowTapped), for: .touchUpInside)
        
        addSubview(lowBtn)
        lowBtn.snp.makeConstraints { make in
            make.top.equalTo(priorityLabel.snp.bottom).offset(15)
            make.leading.equalTo(normalBtn.snp.trailing).offset(15)
            make.height.equalTo(45)
            make.width.equalTo(50)
        }
    }
    
    @objc private func lowTapped() {
        priority = .low
        lowBtn.backgroundColor = lowBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        highBtn.backgroundColor = highBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        normalBtn.backgroundColor = normalBtn.currentTitle?.lowercased() == priority.priorityType ? priority.priorityColor() : .systemGray4
        addTaskBtn.backgroundColor = priority.priorityColor()
    }
    
    private func initAddTaskBtn() {
        addTaskBtn.translatesAutoresizingMaskIntoConstraints = false
        addTaskBtn.translatesAutoresizingMaskIntoConstraints = false
        addTaskBtn.setTitle(R.string.localizable.addTask(), for: .normal)
        addTaskBtn.backgroundColor = priority.priorityColor()
        addTaskBtn.layer.cornerRadius = 10
        addTaskBtn.addTarget(self, action: #selector(addTaskTapped), for: .touchUpInside)
        
        addSubview(addTaskBtn)
        addTaskBtn.snp.makeConstraints { make in
            make.top.equalTo(highBtn.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(45)
        }
    }
    
    @objc private func addTaskTapped() {
        delegate?.addTask(note: textField.text ?? "", priority: priority)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
