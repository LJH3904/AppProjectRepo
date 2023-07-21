//
//  WholesaleListTableViewCell.swift
//  Prototype_LAB6
//
//  Created by 최하늘 on 2023/07/21.
//

import UIKit

class WholesaleListTableViewCell: UITableViewCell {
    static let identifier = "WholesaleListTableViewCell"
    
    let whsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "homeWholesaleList"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill

        return button
    }()
    
    let saler: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "images"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill

        return button
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
        
        [whsButton].forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        whsButton.addSubview(saler)
        saler.translatesAutoresizingMaskIntoConstraints = false

    }
    
    func setLayoutConstraints(){
        
        NSLayoutConstraint.activate([
            whsButton.topAnchor.constraint(equalTo: self.topAnchor),
            whsButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            whsButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            whsButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            saler.topAnchor.constraint(equalTo: whsButton.topAnchor, constant: 22),
            saler.leadingAnchor.constraint(equalTo: whsButton.leadingAnchor, constant: 30)
        ])
    }
}
