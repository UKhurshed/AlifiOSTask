//
//  ProfileViewController.swift
//  AlifiOSTask
//
//  Created by Khurshed Umarov on 19.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
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
        
    }
    
    func deleteAccount() {
        
    }
}
