//
//  AuthViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class AuthViewController: UIViewController {
    
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
    func logIn(name: String, email: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel  = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}
