//
//  SignupViewController.swift
//  Auth_API
//
//  Created by 이민욱 on 2021/06/14.
//

import UIKit
import Moya

class SignupViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var signupBtn: UIButton!
    
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
        
        signupPageUISetup()
        navigationSetup()
    }
    
    func navigationSetup() {
        navigationItem.title = "회원가입"
        navigationItem.leftBarButtonItem = backButton
    }
    
    //이메일 형식 확인
    func isValidEmail(email : String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func signupPageUISetup() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
        passwordLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        passwordTextField.isSecureTextEntry = true
        
        confirmPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextField.widthAnchor.constraint(equalToConstant: view.frame.width - 110).isActive = true
        confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        confirmPasswordTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        confirmPasswordTextField.isSecureTextEntry = true
        
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.layer.cornerRadius = 5
        signupBtn.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 30).isActive = true
        signupBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        signupBtn.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        signupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signupBtn.backgroundColor = .black
        
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        
        provider.request(.signup(name: nameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)) { [self] response in
            
            switch response {
            
            case .success(let res):
                
                if res.statusCode != 200 {
                    let alertVC = UIAlertController(title: "회원가입 오류", message: "네트워크 확인", preferredStyle: UIAlertController.Style.alert)
                    let alertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alertVC.addAction(alertOK)
                    self.present(alertVC, animated: true, completion: nil)
                    
                }
                else {
                    let alertVC = UIAlertController(title: "회원가입 오류", message: "입력한 정보를 확인 해주세요.", preferredStyle: UIAlertController.Style.alert)
                    let alertOK = UIAlertAction(title: "확인", style: .default, handler: nil)
                    alertVC.addAction(alertOK)
                    
                    if nameTextField.text == "" || emailTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == "" {
                        self.present(alertVC, animated: true, completion: nil)
                    }
                    else if isValidEmail(email : emailTextField.text!) == false {
                        self.present(alertVC, animated: true, completion: nil)
                    }
                    else if passwordTextField.text! != confirmPasswordTextField.text! {
                        self.present(alertVC, animated: true, completion: nil)
                    }
                    else {
                        
                        let alertVC = UIAlertController(title: "회원가입 완료", message: "회원가입을 축하해요.", preferredStyle: UIAlertController.Style.alert)
                        let alertOK = UIAlertAction(title: "로그인 화면으로 이동", style: .default) { action in
                            
                            self.navigationController?.popViewController(animated: true)
                            
                        }
                        alertVC.addAction(alertOK)
                        self.present(alertVC, animated: true, completion: nil)
                    }
                }
            
            case .failure(let err):
                print(err)
            }
            
        }
    }
    
    
}



