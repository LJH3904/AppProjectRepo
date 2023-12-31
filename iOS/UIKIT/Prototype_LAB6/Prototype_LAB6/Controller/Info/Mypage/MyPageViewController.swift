//
//  MyPageViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class MyPageViewController: UIViewController {
  
  
  let profileImage : UIImageView = {
    let customImage = UIImage(named: "images")
    let width = 20
    let height = 20
    let newImageRect = CGRect(x: 0, y: 0, width: width, height: height)
    UIGraphicsBeginImageContext(CGSize(width: width, height: height))
    customImage?.draw(in: newImageRect)
    
    let image = UIImageView(image: customImage)
    
    image.layer.cornerRadius = image.frame.width / 2
    image.clipsToBounds = true
    image.layer.borderWidth = 5
    
    image.layer.borderColor = UIColor.black.cgColor
    image.sizeToFit()
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  let nameLabel: UILabel = {
    let nameLabel = UILabel()
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.text = "이름"
    nameLabel.sizeToFit()
    nameLabel.layer.borderColor = UIColor.black.cgColor
    return nameLabel
  }()
  
  let nameTextField: UILabel = {
    let nameTextField = UILabel()
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    nameTextField.text = "이름이 나타나는곳"
    nameTextField.layer.borderColor = UIColor.black.cgColor
    nameTextField.layer.borderWidth = 1
    return nameTextField
  }()
  let emailLabel: UILabel = {
    let emailLabel = UILabel()
    emailLabel.translatesAutoresizingMaskIntoConstraints = false
    emailLabel.text = "이메일"
    
    return emailLabel
  }()
  
  let emailTextField: UILabel = {
    let emailTextField = UILabel()
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    emailTextField.text = "이메일이 나타나는곳"
    emailTextField.layer.borderColor = UIColor.black.cgColor
    emailTextField.layer.borderWidth = 1
    return emailTextField
  }()
  
  let passwordLabel: UILabel = {
    let passwordLabel = UILabel()
    passwordLabel.translatesAutoresizingMaskIntoConstraints = false
    passwordLabel.text = "비밀번호"
    
    return passwordLabel
  }()
  let passwordTextField: UILabel = {
    let passwordTextField = UILabel()
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.text = "비밀번호가 나타나는곳"
    passwordTextField.layer.borderColor = UIColor.black.cgColor
    passwordTextField.layer.borderWidth = 1
    return passwordTextField
  }()
  
  
  let telLabel: UILabel = {
    let telLabel = UILabel()
    telLabel.translatesAutoresizingMaskIntoConstraints = false
    telLabel.text = "전화번호"
    
    return telLabel
  }()
  let telTextField: UILabel = {
    let telTextField = UILabel()
    telTextField.translatesAutoresizingMaskIntoConstraints = false
    telTextField.text = "전화번호 나타나는곳"
    telTextField.layer.borderColor = UIColor.black.cgColor
    telTextField.layer.borderWidth = 1
    
    return telTextField
  }()
  
  
  let introduceTextView: UILabel = {
    let introduceTextView = UILabel()
    introduceTextView.translatesAutoresizingMaskIntoConstraints = false
    introduceTextView.text = "자기소개란"
    introduceTextView.layer.borderColor = UIColor.black.cgColor
    introduceTextView.layer.borderWidth = 5
    introduceTextView.sizeToFit()
    introduceTextView.backgroundColor = .white
    
    return introduceTextView
  }()
  
  
  //왜 안나오지 ? 버튼 > 애드 > 콘스트
  
 
  let changeButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("프로필 변경", for: .normal)
    button.setTitleColor(.black, for: .normal)
    
    button.addTarget(self, action: #selector(goTotheChangeMypageVC), for: .touchUpInside)
    return button
  }()
  
  let addView : UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.layer.borderColor = UIColor.black.cgColor
    view.layer.borderWidth = 5
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "마이페이지"
    navigationItem.rightBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
    
    view.backgroundColor = .white
    view.addSubview(addView)
    
    [profileImage,nameLabel,nameTextField,emailLabel,emailTextField,passwordLabel,passwordTextField,
     telLabel,telTextField,introduceTextView,changeButton]
      .forEach { addView.addSubview($0) }
    
    setupConstraints()
    
  }
  
  
  func setupConstraints(){
    let safeArea = view.safeAreaLayoutGuide
    let padding: CGFloat = 20
    let widthPullScreen = view.frame.width
    let heightPullscreen = view.frame.height
    NSLayoutConstraint.activate([
      addView.leadingAnchor.constraint(equalTo:view.leadingAnchor),
      addView.topAnchor.constraint(equalTo: view.topAnchor),
      addView.heightAnchor.constraint(equalToConstant: heightPullscreen  ),
      addView.widthAnchor.constraint(equalToConstant: widthPullScreen ),
    ])
    
    NSLayoutConstraint.activate([
      profileImage.topAnchor.constraint(equalTo: safeArea.topAnchor),
      profileImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: padding),
      
      nameLabel.topAnchor.constraint(equalTo: safeArea.topAnchor),
      nameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor,constant: padding),
      nameTextField.topAnchor.constraint(equalTo: safeArea.topAnchor),
      nameTextField.leadingAnchor.constraint(equalTo: telLabel.trailingAnchor , constant: padding),
      
      emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
      emailLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: padding),
      emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: padding),
      emailTextField.leadingAnchor.constraint(equalTo: telLabel.trailingAnchor , constant: padding),
      
      passwordLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: padding),
      passwordLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: padding),
      passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: padding),
      passwordTextField.leadingAnchor.constraint(equalTo: telLabel.trailingAnchor , constant: padding),
      
      telLabel.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: padding),
      telLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: padding),
      telTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: padding),
      telTextField.leadingAnchor.constraint(equalTo: telLabel.trailingAnchor , constant: padding),
      
      introduceTextView.topAnchor.constraint(equalTo: telLabel.bottomAnchor, constant: padding),
      introduceTextView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
      introduceTextView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
      
      introduceTextView.widthAnchor.constraint(equalToConstant: 300),
      introduceTextView.heightAnchor.constraint(equalToConstant: 200),
      
      changeButton.topAnchor.constraint(equalTo: introduceTextView.bottomAnchor, constant: padding),
      changeButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding)
    ])
  }
  @objc func goTotheChangeMypageVC(){

        let detailViewController = ChangeMypageViewController()
        navigationController?.pushViewController(detailViewController, animated:.random())
  }
  
  
}

