//
//  WholesaleListViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/21.
//

import UIKit

class WholesaleListViewController: UIViewController {
    
    lazy var sliderLabel: UILabel = {
        let label = UILabel()
        label.text = "가격 설정"
        return label
    }()
    
    lazy var sliderView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var slider: UISlider = {
        
        let slider = UISlider()
        slider.backgroundColor = UIColor.white
        slider.layer.cornerRadius = 10.0
        slider.layer.shadowOpacity = 0.5
        slider.layer.shadowOffset = CGSize(width: 2, height: 3)
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.value = 0.5
        slider.maximumTrackTintColor = UIColor.gray
        slider.minimumTrackTintColor = UIColor.black

        slider.addTarget(self, action: #selector(onChangeValueSlider), for: .valueChanged)
        
        return slider
    }()
    
    lazy var sliderValueLabel: UILabel = {
        let label = UILabel()
        label.text = "20,000원 ~ 50,000원"
        label.textColor = .lightGray
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemGray6
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildInterface()
        setupConstraints()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(WholesaleListTableViewCell.self,
                           forCellReuseIdentifier: WholesaleListTableViewCell.identifier)
    }
    
    
    
    //MARK: - ABOUT Button AddTarget Method
    @objc func goQuotitionVIew(){
        let detailViewController = QuotationViewController()
        navigationController?.pushViewController(detailViewController, animated:.random())
    }
    @objc func goWholesaleDetailViewController(){
        let detailViewController = WholesaleDetailViewController()
        navigationController?.pushViewController(detailViewController, animated:.random())
    }
    
    @objc func onChangeValueSlider(_ sender: UISlider){
        print(sender.value)
    }
}

extension WholesaleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WholesaleListTableViewCell.identifier, for: indexPath) as? WholesaleListTableViewCell else { fatalError() }
        
        cell.whsButton.addTarget(self, action: #selector(goQuotitionVIew), for: .touchUpInside)
        cell.saler.addTarget(self, action: #selector(goWholesaleDetailViewController), for: .touchUpInside)

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


//MARK: - ABOUT UI
extension WholesaleListViewController {
    
    private func buildInterface() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "도매상 리스트"
        navigationItem.largeTitleDisplayMode = .always
        
        [sliderLabel, sliderView,
         tableView].forEach {
            
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        [sliderValueLabel, slider].forEach {
            
            sliderView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            sliderLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: padding),
            sliderLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: padding),
            sliderLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -padding),
            
            sliderView.topAnchor.constraint(equalTo: sliderLabel.bottomAnchor),
            sliderView.leadingAnchor.constraint(equalTo: sliderLabel.leadingAnchor),
            sliderView.trailingAnchor.constraint(equalTo: sliderLabel.trailingAnchor),
            sliderView.heightAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate([
            sliderValueLabel.topAnchor.constraint(equalTo: sliderView.topAnchor, constant: 30),
            sliderValueLabel.leadingAnchor.constraint(equalTo: sliderView.leadingAnchor, constant: 20),
            sliderValueLabel.trailingAnchor.constraint(equalTo: sliderView.trailingAnchor, constant: -20),
            
            slider.topAnchor.constraint(equalTo: sliderValueLabel.bottomAnchor, constant: 10),
            slider.leadingAnchor.constraint(equalTo: sliderValueLabel.leadingAnchor),
            slider.trailingAnchor.constraint(equalTo: sliderValueLabel.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: sliderView.bottomAnchor, constant: padding),
            tableView.leadingAnchor.constraint(equalTo: sliderLabel.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: sliderLabel.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
    }
}
