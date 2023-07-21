//
//  LoginViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class LoginViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "좋도"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let sellButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("판매", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("구매", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let idField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "아이디"
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 5.0
        return textField
    }()
    
    let passwordField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 5.0
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    let findIDPasswordButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("아이디/비밀번호 찾기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [titleLabel, sellButton, buyButton, idField, passwordField, loginButton, signUpButton, findIDPasswordButton]
            .forEach { view.addSubview($0) }
        
        setupConstraints()
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            sellButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            sellButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            
            buyButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            buyButton.leadingAnchor.constraint(equalTo: sellButton.trailingAnchor, constant: padding),
            buyButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            buyButton.widthAnchor.constraint(equalTo: sellButton.widthAnchor),
            
            idField.topAnchor.constraint(equalTo: sellButton.bottomAnchor, constant: padding),
            idField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            idField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            idField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: idField.bottomAnchor, constant: padding),
            passwordField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            passwordField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: padding),
            loginButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 120),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: padding),
            signUpButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            
            findIDPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: padding),
            findIDPasswordButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
        ])
    }
    
    @objc func didTapSignUpButton() {
        let signUpVC = SignUpViewController()
        navigationController?.pushViewController(signUpVC, animated: true)
    }
}
