//
//  ProfileViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileInputView: ProfileViewInput!
    
    private var profileUIView: ProfileUIView {
        self.view as! ProfileUIView
    }
    
    override func loadView() {
        view = ProfileUIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileUIView.delegate = self
    }
    
}

extension ProfileViewController: ProfileUIViewDelegate {
    func logOut() {
        profileInputView.logOut()
    }
    
    func deleteAccount() {
        profileInputView.deleteAccount()
    }
}

extension ProfileViewController: ProfileDisplayLogic {
    
    func success() {
        let authVC = AuthViewController()
        authVC.modalPresentationStyle = .fullScreen
        self.present(authVC, animated: true)
    }
    
    func showError(errorMessage: String) {
        DispatchQueue.main.async {
            let alert  = UIAlertController(title: R.string.localizable.errorOccurred(), message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.dismiss(), style: .cancel) { action in
                let authVC = AuthViewController()
                authVC.modalPresentationStyle = .fullScreen
                self.present(authVC, animated: true)
            })
            self.present(alert, animated: true)
        }
    }
}
