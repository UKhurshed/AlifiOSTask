//
//  AuthUIView.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit
import JGProgressHUD

protocol AuthUIViewDelegate: AnyObject {
    func logIn(name: String, password: String)
}

class AuthUIView: UIView {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let logInTitle = UILabel()
    private let nameTextField = UITextField()
    private let passwordTextField = UITextField()
    private let logInBtn = UIButton()
    private let spinner = JGProgressHUD(style: .dark)
    
    weak var delegate: AuthUIViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initScrollView()
        initContentView()
        initStackView()
        initLogInTitle()
        initNameTextField()
        initPasswordTextField()
        initLogInBtn()
    }
    
    private func initScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    private func initContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView)
        }
    }
    
    private func initStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 20
        
        scrollView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(contentView)
            make.trailing.equalTo(contentView)
            make.centerY.equalToSuperview()
            
        }
    }
    
    private func initLogInTitle() {
        logInTitle.translatesAutoresizingMaskIntoConstraints = false
        logInTitle.text = R.string.localizable.logIn()
        logInTitle.font = .systemFont(ofSize: 30, weight: .semibold)
        
        stackView.addArrangedSubview(logInTitle)
        logInTitle.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
    }
    
    private func initNameTextField() {
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.placeholder = R.string.localizable.yourName()
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.nameTextField.frame.height))
        nameTextField.leftView = padding
        nameTextField.leftViewMode = .always
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        nameTextField.layer.cornerRadius = 10
//        nameTextField.delegate = self
        nameTextField.resignFirstResponder()
        nameTextField.keyboardType = .default
        
        stackView.addArrangedSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
    }
    
    private func initPasswordTextField() {
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = R.string.localizable.password()
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.passwordTextField.frame.height))
        passwordTextField.leftView = padding
        passwordTextField.leftViewMode = .always
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.systemGray4.cgColor
        passwordTextField.layer.cornerRadius = 10
//        emailTextField.delegate = self
        passwordTextField.resignFirstResponder()
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        stackView.addArrangedSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.height.equalTo(50)
        }
    }
    
    private func initLogInBtn() {
        logInBtn.translatesAutoresizingMaskIntoConstraints = false
        logInBtn.setTitle("Log In", for: .normal)
        logInBtn.setTitleColor(.white, for: .normal)
        logInBtn.backgroundColor = .blue
        logInBtn.layer.cornerRadius = 15
        logInBtn.addTarget(self, action: #selector(logInTapped), for: .touchUpInside)
        
        stackView.addArrangedSubview(logInBtn)
        
        logInBtn.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(45)
        }
    }
    
    @objc private func logInTapped() {
        delegate?.logIn(name: nameTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func showLoader() {
        spinner.show(in: self)
    }
    
    public func hideLoader() {
        spinner.dismiss(animated: true)
    }
}
