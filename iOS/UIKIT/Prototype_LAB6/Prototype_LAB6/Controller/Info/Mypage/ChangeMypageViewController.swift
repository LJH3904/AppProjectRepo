//
//  ChangeMypageViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/23.
//

import UIKit
enum CameraError : Error{
    case notAvailable
}
class ChangeMypageViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  
  let imgPicker = UIImagePickerController()
  

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
  
  let nameTextField: UITextField = {
    let nameTextField = UITextField()
    nameTextField.translatesAutoresizingMaskIntoConstraints = false
    nameTextField.placeholder = "이름 입력"
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
  
  let emailTextField: UITextField = {
    let emailTextField = UITextField()
    emailTextField.translatesAutoresizingMaskIntoConstraints = false
    emailTextField.placeholder = "이메일 입력"
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
  let passwordTextField: UITextField = {
    let passwordTextField = UITextField()
    passwordTextField.translatesAutoresizingMaskIntoConstraints = false
    passwordTextField.placeholder = "별명 입력"
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
  let telTextField: UITextField = {
    let telTextField = UITextField()
    telTextField.translatesAutoresizingMaskIntoConstraints = false
    telTextField.placeholder = "전화번호 입력"
    telTextField.layer.borderColor = UIColor.black.cgColor
    telTextField.layer.borderWidth = 1
    
    return telTextField
  }()
  
  
  let introduceTextView: UITextView = {
    let introduceTextView = UITextView()
    introduceTextView.translatesAutoresizingMaskIntoConstraints = false
    introduceTextView.text = "변경하실거면 변경 버튼 누르세요."
    introduceTextView.layer.borderColor = UIColor.black.cgColor
    introduceTextView.layer.borderWidth = 5
    introduceTextView.sizeToFit()
    introduceTextView.backgroundColor = .white
    
    return introduceTextView
  }()
  let submitButton : UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("변경", for: .normal)
    button.setTitleColor(.black, for: .normal) // 이건 무조건 해야함 안하면 흰색되버림
    
    button.addTarget(self, action: #selector(a), for: .touchUpInside)
    return button
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = .systemBackground
      navigationItem.title = "정보수정"
      imgPicker.delegate = self
      [profileImage,nameLabel,nameTextField,emailLabel,emailTextField,passwordLabel,passwordTextField,
       telLabel,telTextField,introduceTextView,submitButton]
        .forEach { view.addSubview($0) }
      setupConstraints()
    }
  
  func setupConstraints(){
    let safeArea = view.safeAreaLayoutGuide
    let padding: CGFloat = 20
    
    NSLayoutConstraint.activate([
      profileImage.topAnchor.constraint(equalTo: safeArea.topAnchor),
      profileImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: padding),
      submitButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: padding),
      submitButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding + CGFloat(30)),
      
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
      
      
      
    ])
  }
  @objc func a(){
    let alert =  UIAlertController(title: "Title", message: "message", preferredStyle: .actionSheet)
    let library =  UIAlertAction(title: "앨범에서 가져오기", style: .default) { (action) in self.openLibrary() }
    let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
        guard (try? self.openCamera()) != nil else{
            let alert = UIAlertController(title: "카메라 접근 실패", message: "카메라를 이용할 수 없습니다.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: false, completion: nil)
            print("Camera Not Available")
            return
        }
    }
    let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
    alert.addAction(library)
    alert.addAction(camera)
    alert.addAction(cancel)
    present(alert, animated: true, completion: nil)
  }
  func openLibrary(){
      imgPicker.sourceType = .photoLibrary
      present(imgPicker, animated: false, completion: nil)
  }
  func openCamera() throws{
      guard UIImagePickerController .isSourceTypeAvailable(.camera) else {
          throw CameraError.notAvailable
      }
      imgPicker.sourceType = .camera
      present(imgPicker, animated: false, completion: nil)
  }
  

}
extension MyPageViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[UIImagePickerController.InfoKey.originalImage] is UIImage{
          
            print(info)
        }
        dismiss(animated: true, completion: nil)
    }
}
