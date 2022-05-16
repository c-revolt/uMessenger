//
//  ViewController.swift
//  uMessenger
//
//  Created by Александр Прайд on 16.05.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoLabel: UILabel = {
        let label = UILabel()
        label.text = K.appName
        label.font = UIFont(name: K.avenirFont, size: 50)
        label.textAlignment = .center
        
        return label
    }()
    
    //private let loginButton = UIButton(title: K.ButtonTitles.logintitle)
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(K.ButtonTitles.logintitle, for: .normal)
        button.setTitleColor(UIColor.mainPink(), for: .normal)
        button.titleLabel?.font = UIFont(name: K.avenirFont, size: 22)
        button.backgroundColor = .white
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 6
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(K.ButtonTitles.signInTitle, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont(name: K.avenirFont, size: 22)
        button.backgroundColor = .mainBlack()
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 7
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.4
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return button
    }()
    
    private let backView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
       
        
        setupUI()
    }
    
    // MARK: - Setup UI Elements
    
    private func setupUI() {
        setupLogoLabelConstraints()
        logoAnimated()
        setupBackView()
    }
    
    private func logoAnimated() {
        
        logoLabel.text = ""
        var charIndex = 0.0
        let titleText = K.appName
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.logoLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    private func setupLogoLabelConstraints() {
        
        view.addSubview(logoLabel)
        logoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            logoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoLabel.heightAnchor.constraint(equalToConstant: 74)
        ])
    }
    
    private func setupBackView() {
        view.addSubview(backView)
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: logoLabel.bottomAnchor, constant: 100),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        setupLoginButton()
        setupSignInButton()
        
    }
    
    private func setupLoginButton() {
        
        backView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 5),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }
    
    private func setupSignInButton() {
        backView.addSubview(signInButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            signInButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 10),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            signInButton.heightAnchor.constraint(equalToConstant: 65)
        ])
    }

}

