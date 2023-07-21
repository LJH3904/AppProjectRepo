//
//  InfoTableViewCell.swift
//  Prototype_LAB6
//
//  Created by 최하늘 on 2023/07/21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    static let identifier = "InfoTableViewCell"
    
    lazy var infoListNameLabel = { () -> UILabel in
        let label = UILabel()
        label.text = "가을로 가슴속에 하나에 불러 내린 릴케 언덕 멀리 까닭입니다. 이름을 다하지 이런 오면 언덕 듯합니다. 동경과 잔디가 때 가을 추억과 있습니다. 마리아 릴케 별에도 언덕 부끄러운 헤는 거외다. 못 위에도 오면 까닭입니다."
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func addViews() {
        
        addSubview(infoListNameLabel)
        infoListNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func setLayoutConstraints(){
        NSLayoutConstraint.activate([
            infoListNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            infoListNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:  20),
            infoListNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -20),
            infoListNameLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
}
