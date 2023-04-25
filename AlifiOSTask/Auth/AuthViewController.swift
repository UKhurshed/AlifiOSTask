//
//  AuthViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
    var authPresenter: AuthPresenter!
    
    private var authUIView: AuthUIView {
        self.view as! AuthUIView
    }
    
    override func loadView() {
        view = AuthUIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        authUIView.delegate = self
    }
}

extension AuthViewController: AuthUIViewDelegate {
    func logIn(email: String, password: String) {
        print("name: \(email) password: \(password)")
        authPresenter.logInUser(user: UserViewInput(email: email, password: password))
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel  = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}

extension AuthViewController: AuthDisplayLogic {
    func showLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            self.authUIView.showLoader()
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            self.view.isUserInteractionEnabled = false
            self.authUIView.hideLoader()
        }
    }
    
    func success() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func showError(errorMessage: String) {
        DispatchQueue.main.async {
            self.authUIView.hideLoader()
            let alert  = UIAlertController(title: R.string.localizable.errorOccurred(), message: errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: R.string.localizable.dismiss(), style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
}
