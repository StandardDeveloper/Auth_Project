//
//  FindPWViewController.swift
//  Auth_API
//
//  Created by 이민욱 on 2021/06/14.
//

import UIKit
import Moya

class FindPWViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var findPWBtn: UIButton!
    
    let provider = MoyaProvider<AuthAPI>()
    
    lazy var backButton: UIBarButtonItem = {
        let buttonIcon = UIImage(systemName: "chevron.backward")
        let button = UIBarButtonItem(title: nil, style: UIBarButtonItem.Style.done, target: self, action: #selector(backBtn(_:)))
        button.image = buttonIcon
        button.tintColor = .black
        return button
    }()
    
    @objc func backBtn(_ sender:UIBarButtonItem!){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationSetup()
        findPWPageUISetup()
    }
    
    func navigationSetup() {
        navigationItem.title = "아이디 찾기"
        navigationItem.leftBarButtonItem = backButton
    }
    
    func findPWPageUISetup() {
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        findPWBtn.translatesAutoresizingMaskIntoConstraints = false
        findPWBtn.layer.cornerRadius = 5
        findPWBtn.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30).isActive = true
        findPWBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        findPWBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        findPWBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findPWBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        findPWBtn.backgroundColor = .black
        
    }
    
    @IBAction func findPasswordBtn(_ sender: Any) {
        
        provider.request(.forgotpassword(email: emailTextField.text!)) { response in
            
            switch response {
            
            case .success(let res):
                if res.statusCode != 200 {
                    print("network error")
                }
                else {
                    print("find id")
                }
                
            case .failure(let err):
                print(err)
                
            }
            
        }
        
    }
    
    
}
