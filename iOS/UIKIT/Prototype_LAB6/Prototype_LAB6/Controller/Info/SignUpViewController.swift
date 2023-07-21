//
//  SignUPViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sign Up"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let nameField = createTextField(withPlaceholder: "이름")
    let emailField = createTextField(withPlaceholder: "이메일")
    let passwordField = createTextField(withPlaceholder: "비밀번호")
    let phoneNumberField = createTextField(withPlaceholder: "전화번호")
    let verifyButton = createButton(withTitle: "인증")
    let signUpButton = createButton(withTitle: "회원가입")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    private static func createTextField(withPlaceholder placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = placeholder
        textField.backgroundColor = UIColor.white
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.cornerRadius = 5.0
        return textField
    }
    
    //저거진짜 맞을거같은데 ㅋㅋ
    private static func createButton(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }
    
    private func setupUI() {
        [titleLabel, nameField, emailField, passwordField, phoneNumberField, verifyButton, signUpButton]
            .forEach { view.addSubview($0) }
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            nameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            nameField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            nameField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            nameField.heightAnchor.constraint(equalToConstant: 50),
            
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: padding),
            emailField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            emailField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: padding),
            passwordField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            passwordField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneNumberField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: padding),
            phoneNumberField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            phoneNumberField.heightAnchor.constraint(equalToConstant: 50),
            
            verifyButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: padding),
            verifyButton.leadingAnchor.constraint(equalTo: phoneNumberField.trailingAnchor, constant: padding),
            verifyButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            verifyButton.widthAnchor.constraint(equalToConstant: 50),
            verifyButton.heightAnchor.constraint(equalToConstant: 50),
            
            signUpButton.topAnchor.constraint(equalTo: verifyButton.bottomAnchor, constant: padding),
            signUpButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            signUpButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
