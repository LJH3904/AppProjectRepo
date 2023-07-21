import UIKit

class QuotationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let serviceTypes = ["일반", "반포장", "포장"]
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "견적 신청 페이지"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    let serviceTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "서비스 종류"
        return label
    }()
    
    let serviceTypePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    let itemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "물품"
        return label
    }()
    
    let itemTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "물품을 입력해주세요."
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "날짜"
        return label
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .date
        return picker
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "주소"
        return label
    }()
    
    let addressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "주소를 입력해주세요."
        textField.borderStyle = .roundedRect
        return textField
    }()
    
  let pageSave: UIButton = {
      let button = UIButton()
      button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("저장하기", for: .normal)
      button.setTitleColor(.systemBlue, for: .normal)
      return button
  }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        serviceTypePicker.delegate = self
        serviceTypePicker.dataSource = self
        
        [titleLabel,
         serviceTypeLabel, serviceTypePicker,
         itemLabel, itemTextField,
         dateLabel, datePicker,
         addressLabel, addressTextField,pageSave]
            .forEach { view.addSubview($0) }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            serviceTypeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            serviceTypeLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            
            serviceTypePicker.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            serviceTypePicker.leadingAnchor.constraint(equalTo: serviceTypeLabel.trailingAnchor, constant: padding),
            serviceTypePicker.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            itemLabel.topAnchor.constraint(equalTo: serviceTypePicker.bottomAnchor, constant: padding),
            itemLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            
            itemTextField.topAnchor.constraint(equalTo: serviceTypePicker.bottomAnchor, constant: padding),
            itemTextField.leadingAnchor.constraint(equalTo: itemLabel.trailingAnchor, constant: padding),
            itemTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            itemTextField.heightAnchor.constraint(equalToConstant: 50),
            
            dateLabel.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            
            datePicker.topAnchor.constraint(equalTo: itemTextField.bottomAnchor, constant: padding),
            datePicker.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: padding),
            datePicker.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            addressLabel.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: padding),
            addressLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            
            addressTextField.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: padding),
            addressTextField.leadingAnchor.constraint(equalTo: addressLabel.trailingAnchor, constant: padding),
            addressTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            addressTextField.heightAnchor.constraint(equalToConstant: 50),
            pageSave.topAnchor.constraint(equalTo: addressTextField.bottomAnchor, constant: padding),
            pageSave.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -padding)
        ])
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return serviceTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return serviceTypes[row]
    }
}
