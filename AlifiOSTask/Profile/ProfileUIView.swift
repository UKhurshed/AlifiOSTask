//
//  ProfileUIView.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

protocol ProfileUIViewDelegate: AnyObject {
    func logOut()
    func deleteAccount()
}

class ProfileUIView: UIView {
    
    private let emailTitle = UILabel()
    private let emailValue = UILabel()
    private let logOutBtn = UIButton()
    private let deleteAccountBtn = UIButton()
    
    weak var delegate: ProfileUIViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        initNameTitle()
        initNameValue()
        initLogOutBtn()
        initDeleteAccountBtn()
    }
    
    private func initNameTitle() {
        emailTitle.translatesAutoresizingMaskIntoConstraints = false
        emailTitle.font = .systemFont(ofSize: 19, weight: .semibold)
        emailTitle.text = R.string.localizable.userName()
        
        addSubview(emailTitle)
        emailTitle.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(15)
        }
    }
    
    private func initNameValue() {
        emailValue.translatesAutoresizingMaskIntoConstraints = false
        emailValue.font = .systemFont(ofSize: 18, weight: .medium)
        
        addSubview(emailValue)
        emailValue.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(51)
            make.leading.equalTo(emailTitle.snp.trailing).offset(7)
        }
    }
    
    private func initLogOutBtn() {
        logOutBtn.translatesAutoresizingMaskIntoConstraints = false
        logOutBtn.setTitle("Log Out", for: .normal)
        logOutBtn.setTitleColor(.red, for: .normal)
        logOutBtn.backgroundColor = .white
        logOutBtn.layer.borderColor = UIColor.red.cgColor
        logOutBtn.layer.cornerRadius = 15
        logOutBtn.layer.borderWidth = 1.0
        logOutBtn.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        
        addSubview(logOutBtn)
        logOutBtn.snp.makeConstraints { make in
            make.top.equalTo(emailValue.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(25)
            make.height.equalTo(40)
            make.width.equalTo(110)
        }
    }
    
    @objc private func logOutTapped() {
        delegate?.logOut()
    }
    
    private func initDeleteAccountBtn() {
        deleteAccountBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteAccountBtn.setTitle("Delete account", for: .normal)
        deleteAccountBtn.setTitleColor(.red, for: .normal)
        deleteAccountBtn.backgroundColor = .white
        deleteAccountBtn.layer.borderColor = UIColor.red.cgColor
        deleteAccountBtn.layer.cornerRadius = 15
        deleteAccountBtn.layer.borderWidth = 1.0
        deleteAccountBtn.addTarget(self, action: #selector(deleteAccountTapped), for: .touchUpInside)
        
        addSubview(deleteAccountBtn)
        deleteAccountBtn.snp.makeConstraints { make in
            make.top.equalTo(emailValue.snp.bottom).offset(40)
            make.trailing.equalToSuperview().offset(-25)
            make.height.equalTo(40)
            make.width.equalTo(160)
        }
    }
    
    @objc private func deleteAccountTapped() {
        delegate?.deleteAccount()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setupData(name: String) {
        emailValue.text = name
    }

}
