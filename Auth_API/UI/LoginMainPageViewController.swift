//
//  LoginMainPageViewController.swift
//  Auth_API
//
//  Created by 이민욱 on 2021/06/13.
//

import UIKit
import Moya
import SwiftyJSON

class LoginMainPageViewController: UIViewController {
    
    @IBOutlet weak var hellowLabel: UILabel!
    @IBOutlet weak var hellowLabel2: UILabel!
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    
    @IBOutlet weak var findIDBtn: UIButton!
    @IBOutlet weak var findPWBtn: UIButton!
    @IBOutlet weak var signupBtn: UIButton!
    
    @IBOutlet weak var partitionView: UIView!
    @IBOutlet weak var partitionView2: UIView!
    @IBOutlet weak var partitionView3: UIView!
    @IBOutlet weak var partitionView4: UIView!
    
    @IBOutlet weak var loginTypelabel: UILabel!
    @IBOutlet weak var facebookLoginBtn: UIButton!
    
    let loginProvider = MoyaProvider<AuthAPI>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let token = UserDefaults.standard.string(forKey: "token")
        
        if(token != nil) {
            
            let loginCompleteVC = self.storyboard?.instantiateViewController(withIdentifier: "loginCompleteVC")
            let window = UIApplication.shared.windows.first
            window?.rootViewController = loginCompleteVC
        }
        
        loginMainPageUISetup()
        navigationItem.title = "로그인"
    }
    
    func loginMainPageUISetup() {
        
        hellowLabel.translatesAutoresizingMaskIntoConstraints = false
        hellowLabel.font = UIFont.italicSystemFont(ofSize: 30)
        hellowLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90).isActive = true
        hellowLabel.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        hellowLabel2.translatesAutoresizingMaskIntoConstraints = false
        hellowLabel2.font = UIFont.italicSystemFont(ofSize: 30)
        hellowLabel2.topAnchor.constraint(equalTo: hellowLabel.bottomAnchor, constant: 10).isActive = true
        hellowLabel2.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        //id
        idTextfield.translatesAutoresizingMaskIntoConstraints = false
        idTextfield.layer.cornerRadius = 5
        idTextfield.topAnchor.constraint(equalTo: hellowLabel2.bottomAnchor, constant: 40).isActive = true
        idTextfield.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        idTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 35).isActive = true
        idTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //pw
        pwTextfield.translatesAutoresizingMaskIntoConstraints = false
        pwTextfield.layer.cornerRadius = 5
        pwTextfield.topAnchor.constraint(equalTo: idTextfield.bottomAnchor, constant: 10).isActive = true
        pwTextfield.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        pwTextfield.widthAnchor.constraint(equalToConstant: view.frame.width - 35).isActive = true
        pwTextfield.heightAnchor.constraint(equalToConstant: 40).isActive = true
        pwTextfield.isSecureTextEntry = true
        
        //loginBtn
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.layer.cornerRadius = 5
        loginBtn.topAnchor.constraint(equalTo: pwTextfield.bottomAnchor, constant: 10).isActive = true
        loginBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        loginBtn.widthAnchor.constraint(equalToConstant: view.frame.width - 35).isActive = true
        loginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginBtn.backgroundColor = .black
        
        
        findIDBtn.translatesAutoresizingMaskIntoConstraints = false
        findIDBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        findIDBtn.rightAnchor.constraint(equalTo: findPWBtn.leftAnchor, constant: -20).isActive = true
        findIDBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findIDBtn.tintColor = .black
        
        partitionView.translatesAutoresizingMaskIntoConstraints = false
        partitionView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        partitionView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30).isActive = true
        partitionView.rightAnchor.constraint(equalTo: findPWBtn.leftAnchor, constant: -10).isActive = true
        partitionView.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        findPWBtn.translatesAutoresizingMaskIntoConstraints = false
        findPWBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        findPWBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        findPWBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        findPWBtn.tintColor = .black
        
        
        partitionView2.translatesAutoresizingMaskIntoConstraints = false
        partitionView2.heightAnchor.constraint(equalToConstant: 10).isActive = true
        partitionView2.widthAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView2.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30).isActive = true
        partitionView2.rightAnchor.constraint(equalTo: findPWBtn.rightAnchor, constant: 10).isActive = true
        partitionView2.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 10).isActive = true
        signupBtn.leftAnchor.constraint(equalTo: findPWBtn.rightAnchor, constant: 20).isActive = true
        signupBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signupBtn.tintColor = .black
        
        partitionView3.translatesAutoresizingMaskIntoConstraints = false
        partitionView3.heightAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView3.widthAnchor.constraint(equalToConstant: 100).isActive = true
        partitionView3.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 100).isActive = true
        partitionView3.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        partitionView3.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        loginTypelabel.translatesAutoresizingMaskIntoConstraints = false
        loginTypelabel.font = UIFont.italicSystemFont(ofSize: 13)
        loginTypelabel.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 93).isActive = true
        loginTypelabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        partitionView4.translatesAutoresizingMaskIntoConstraints = false
        partitionView4.heightAnchor.constraint(equalToConstant: 1).isActive = true
        partitionView4.widthAnchor.constraint(equalToConstant: 100).isActive = true
        partitionView4.topAnchor.constraint(equalTo: findPWBtn.bottomAnchor, constant: 100).isActive = true
        partitionView4.leftAnchor.constraint(equalTo: loginTypelabel.rightAnchor, constant: 10).isActive = true
        partitionView4.backgroundColor = UIColor(red: 225/255, green: 225/255, blue: 225/255, alpha: 1)
        
        facebookLoginBtn.translatesAutoresizingMaskIntoConstraints = false
        facebookLoginBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        facebookLoginBtn.widthAnchor.constraint(equalToConstant: 50).isActive = true
        facebookLoginBtn.topAnchor.constraint(equalTo: loginTypelabel.bottomAnchor, constant: 20).isActive = true
        facebookLoginBtn.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 50).isActive = true
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        loginProvider.request(.login(email: idTextfield.text!, password: pwTextfield.text!)) { response in
            
            switch response {
            case .success(let res):
                
                //자동로그인을 위해 token을 UserDefaults에 저장
                let jsonData = JSON(res.data)
                let tokenIfno = jsonData["token"].string
                UserDefaults.standard.setValue(tokenIfno, forKey: "token")
                
                //로그인 실패
                if(res.statusCode != 200) {
                    
                    let Alertvc = UIAlertController(title: "로그인 실패", message: "", preferredStyle: .actionSheet)
                    let AlertOK = UIAlertAction(title: "로그인정보 입력 오류", style: .default, handler: nil)
                    Alertvc.addAction(AlertOK)
                    self.present(Alertvc, animated: true, completion: nil)
                    
                }
                //로그인 성공
                else {
  
                    let loginCompleteVC = self.storyboard?.instantiateViewController(withIdentifier: "loginCompleteVC")
                    let window = UIApplication.shared.windows.first
                    window?.rootViewController = loginCompleteVC
                    
                }
                
            case .failure(let err):
                print("LoginError : ", err)
            }
            
        }
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
}
