//
//  LoginCompleteViewController.swift
//  Auth_API
//
//  Created by 이민욱 on 2021/06/14.
//

import UIKit
import Kingfisher

class LoginCompleteViewController: UIViewController {
    
    @IBOutlet weak var hellowLabel: UILabel!
    @IBOutlet weak var hellowLabel2: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var logupBtn: UIButton!
    
    var networkProvider = AuthNetworkManager()
    let token = UserDefaults.standard.string(forKey: "token")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginCompletePageUISetup()
        getProfileData()
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    
    
    func loginCompletePageUISetup() {
        
        hellowLabel.translatesAutoresizingMaskIntoConstraints = false
        hellowLabel.font = UIFont.italicSystemFont(ofSize: 30)
        hellowLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        hellowLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        hellowLabel2.translatesAutoresizingMaskIntoConstraints = false
        hellowLabel2.font = UIFont.italicSystemFont(ofSize: 30)
        hellowLabel2.topAnchor.constraint(equalTo: hellowLabel.bottomAnchor, constant: 10).isActive = true
        hellowLabel2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.topAnchor.constraint(equalTo: hellowLabel2.bottomAnchor, constant: 50).isActive = true
        profileImageView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.italicSystemFont(ofSize: 15)
        nameLabel.topAnchor.constraint(equalTo: hellowLabel2.bottomAnchor, constant: 60).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 50).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 35).isActive = true
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.font = UIFont.italicSystemFont(ofSize: 15)
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 50).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 35).isActive = true
        
        logupBtn.translatesAutoresizingMaskIntoConstraints = false
        logupBtn.layer.cornerRadius = 5
        logupBtn.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30).isActive = true
        logupBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        logupBtn.widthAnchor.constraint(equalToConstant: view.frame.width - 35).isActive = true
        logupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        logupBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        logupBtn.backgroundColor = .black
        
    }
    
    func getProfileData() {
        
        if token != nil {
            networkProvider.getProfile(token: String(token!)) { results in
                self.nameLabel.text = results.name
                let imageURL = URL(string: results.avatar)
                self.profileImageView.kf.setImage(with: imageURL)
                self.emailLabel.text = results.email
            }
        }
        
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        
        UserDefaults.standard.removeObject(forKey: "token")
        navigationController?.popViewController(animated: true)
    }
    
}
