//
//  FirstViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

class FirstViewController: UIViewController {
    
    let categoryList: [String] = ["소주", "맥주", "막걸리", "음료수", "일회용품", "기타"]
    
    // 내비게이션 버튼
//    let navigationButton: UIButton = {
//        let navigationButton = UIButton(type: .custom)
//        navigationButton.translatesAutoresizingMaskIntoConstraints = false
//        navigationButton.setImage(UIImage(systemName: "plus"), for: .normal)
//        return navigationButton
//    }()
    
    // 검색창
    let searchLabel: UILabel = {
        let searchLabel = UILabel()
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        searchLabel.text = "물품 검색"
        return searchLabel
    }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "원하는 물품의 이름을 입력하세요."
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    // 카테고리
//    let categoryButton: UIButton = {
//        let categoryButton = UIButton()
//        categoryButton.setImage(UIImage(named: "Button"), for: .normal)
//        categoryButton.contentMode = .scaleAspectFit
//        categoryButton.addTarget(self, action: #selector(emptyFunc), for: .touchUpInside)
//        return categoryButton
//    }()
    
    let categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.text = "물품 카테고리"
        return categoryLabel
    }()
    
    let categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // 광고
    let advertisementView: UIView = {
        let advertisementUIView = UIView()
        advertisementUIView.translatesAutoresizingMaskIntoConstraints = false
        advertisementUIView.layer.cornerRadius = 10
        advertisementUIView.backgroundColor = .systemGray5
        return advertisementUIView
    }()
    
    let advertisementLabel: UILabel = {
        let advertisementLabel = UILabel()
        advertisementLabel.translatesAutoresizingMaskIntoConstraints = false
        advertisementLabel.text = "광고"
        return advertisementLabel
    }()
    
    // 후기
//    let comment: UIButton = {
//        let comment = UIButton()
//        comment.setImage(UIImage(named: "ReviewImage"), for: .normal)
//        comment.contentMode = .scaleAspectFit
//        return comment
//    }()
    //리뷰창 -> 거리순 추천
    
    
//    let commendView: UIView = {
//        let commendUIView = UIView()
//        commnedUIView.translatesAutoresizingMaskIntoConstraints = false
//        commendUIView.layer.cornerRadius = 10
//        commendUIView.backgroundColor = .systemGray6
//        return commendIView
//    }()
    
    let commendLabel: UILabel = {
        let commendLabel = UILabel()
        commendLabel.translatesAutoresizingMaskIntoConstraints = false
        commendLabel.text = "거리순 추천"
        return commendLabel
    }()
//
//    let reviewRatingLabel: UILabel = {
//        let elementLabel = UILabel()
//        elementLabel.translatesAutoresizingMaskIntoConstraints = false
//        elementLabel.text = "⭐️⭐️⭐️⭐️⭐️"
//        return elementLabel
//    }()
//
//    let reviewContentLabel: UILabel = {
//        let elementLabel = UILabel()
//        elementLabel.translatesAutoresizingMaskIntoConstraints = false
//        elementLabel.text = "후기 내용"
//        return elementLabel
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        buildInterface()
    }
    
    func buildInterface(){

        let padding: CGFloat = 20
        
        navigationItem.title = "홈 화면"
        
        //스크롤 뷰
        let scrollView: UIScrollView = UIScrollView()
//        scrollView.backgroundColor = .systemMint
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.bounds.width*4, height: 140)
//        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        
        //스택뷰
        let stackView: UIStackView = UIStackView()
        stackView.axis = .horizontal
//        stackView.alignment = .center
        stackView.spacing = 20
        scrollView.addSubview(stackView)
        
        
        
//        view.addSubview(navigationButton)
        view.addSubview(searchTextField)
        view.addSubview(searchLabel)
        view.addSubview(categoryLabel)
        advertisementView.addSubview(advertisementLabel)
        view.addSubview(advertisementView)
        view.addSubview(commendLabel)
//        commendView.addSubview(reviewContentLabel)
//        commendView.addSubview(reviewRatingLabel)
//        view.addSubview(commendView)
        view.addSubview(categoryCollectionView)
        
//        navigationButton.addTarget(self, action: #selector(goQuotes), for: .touchUpInside)
        
        
        //스크롤뷰 스택뷰 autolayout
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        

        scrollView.topAnchor.constraint(equalTo: commendLabel.bottomAnchor, constant: 7).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding).isActive = true
        scrollView
            .heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        
        for _ in 0...5 {

            let whsButton: UIButton = UIButton()
            //상인정보로 갈 이미지 버튼
            let saler: UIButton = UIButton()
            saler.setImage(UIImage(named: "images"), for: .normal)
            whsButton.setImage(UIImage(named: "homeWholesaleList"), for: .normal)
//            whsButton.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)

            whsButton.addSubview(saler)
            
            saler.translatesAutoresizingMaskIntoConstraints = false
            saler.topAnchor.constraint(equalTo: whsButton.topAnchor, constant: 22).isActive = true
            saler.leadingAnchor.constraint(equalTo: whsButton.leadingAnchor, constant: 16).isActive = true
            
            whsButton.addTarget(self, action: #selector(goQuotes), for: .touchUpInside)
            stackView.addArrangedSubview(whsButton)
            saler.addTarget(self, action: #selector(goDetail), for: .touchUpInside)
            stackView.addArrangedSubview(whsButton)
            
        }
        
     
        
        NSLayoutConstraint.activate([
//            navigationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            navigationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            navigationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            searchLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            searchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            searchTextField.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: padding),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            searchTextField.heightAnchor.constraint(equalToConstant: 50),
            
            categoryLabel.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: padding),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            categoryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: padding),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 220),
            
            advertisementLabel.centerXAnchor.constraint(equalTo: advertisementView.centerXAnchor),
            advertisementLabel.centerYAnchor.constraint(equalTo: advertisementView.centerYAnchor),
            
            advertisementView.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: padding),
            advertisementView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            advertisementView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            advertisementView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            advertisementView.heightAnchor.constraint(equalToConstant: 50),
            
            commendLabel.topAnchor.constraint(equalTo: advertisementView.bottomAnchor, constant: padding),
            commendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            commendLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//
////            reviewView.topAnchor.constraint(equalTo: advertisementView.bottomAnchor, constant: padding),
//            reviewView.topAnchor.constraint(equalTo: reviewLabel.bottomAnchor, constant: padding),
//            reviewView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
//            reviewView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
//            reviewView.heightAnchor.constraint(equalToConstant: 100),
//
//            reviewRatingLabel.leadingAnchor.constraint(equalTo: reviewView.leadingAnchor, constant: padding),
//            reviewRatingLabel.topAnchor.constraint(equalTo: reviewView.topAnchor, constant: padding),
//            reviewContentLabel.leadingAnchor.constraint(equalTo: reviewRatingLabel.trailingAnchor, constant: padding),
//            reviewContentLabel.centerYAnchor.constraint(equalTo: reviewRatingLabel.centerYAnchor),
        ])
        
        /*
         imageView.contentMode = .scaleAspectFit
         imageView.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
         imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         imageView.topAnchor.constraint(equalTo: view.topAnchor),
         imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
         */
    }
    
    @objc func goQuotes(){
        let detailViewController = QuotationViewController()
        navigationController?.pushViewController(detailViewController, animated:.random())
    }

    @objc func goDetail(){
        let detailViewController = WholesaleDetailViewController()
        navigationController?.pushViewController(detailViewController, animated:.random())
    }
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = WholesaleListViewController()
        navigationController?.pushViewController(detailViewController, animated:.random())
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
//        let data = categoryList[indexPath.item]
        cell.backgroundColor = UIColor.systemGray5
        cell.layer.cornerRadius = 10
        return cell
    }
}

extension FirstViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = 100
        let cellHeight = 100
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
