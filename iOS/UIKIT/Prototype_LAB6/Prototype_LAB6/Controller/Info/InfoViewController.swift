//
//  InfoViewController.swift
//  Prototype_LAB6
//
//  Created by 최하늘 on 2023/07/21.
//

import UIKit

class InfoViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    let infoListNameArray = ["견적신청 내역", "마이페이지"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildInterface()
        setLayoutConstraints()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InfoTableViewCell.self,
                           forCellReuseIdentifier: InfoTableViewCell.identifier)
    }
}

//MARK: - ABOUT TableView
extension InfoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoListNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as? InfoTableViewCell else { fatalError() }
        
        cell.infoListNameLabel.text = "\(infoListNameArray[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let thirdViewController = ThirdViewController()
            navigationController?.pushViewController(thirdViewController, animated:.random())
            
        case 1:
            let myPageViewController = MyPageViewController()
            navigationController?.pushViewController(myPageViewController, animated:.random())
            
        default:
            return
        }
    }
}

//MARK: - ABOUT UI
extension InfoViewController {
    
    func buildInterface() {
        view.backgroundColor = .systemBackground
        navigationItem.title = "INFO"
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLayoutConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
