import UIKit

class CardView: UIView {
    let nameLabel = UILabel()
    let quoteLabel = UILabel()
    let dateLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4.0
        
        setupLabels()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func setupLabels() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        quoteLabel.font = UIFont.systemFont(ofSize: 16)
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont.systemFont(ofSize: 16)
        dateLabel.textColor = .gray
        
        [nameLabel, quoteLabel, dateLabel].forEach { self.addSubview($0) }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            quoteLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            quoteLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            dateLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            dateLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            dateLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
    
    func configure(with estimate: (String, String, String)) {
        nameLabel.text = "중개상: \(estimate.0)"
        quoteLabel.text = "견적: \(estimate.1)"
        dateLabel.text = "날짜: \(estimate.2)"
    }
}

class RequestedCardView: CardView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemBlue
        nameLabel.textColor = .white
        quoteLabel.textColor = .white
        dateLabel.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func configure(with estimate: (String, String, String)) {
        nameLabel.text = "\(estimate.0)"
        quoteLabel.text = "견적: \(estimate.1)"
        dateLabel.text = "날짜: \(estimate.2)"
    }
}

class EstimateCardView: CardView {
    let statusLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        nameLabel.textColor = .black
        quoteLabel.textColor = .black
        dateLabel.textColor = .black
        
        setupStatusLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    func setupStatusLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.text = "진행중"
        statusLabel.textColor = .red
        statusLabel.font = UIFont.boldSystemFont(ofSize: 16)
        statusLabel.textAlignment = .right
        self.addSubview(statusLabel)
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    override func configure(with estimate: (String, String, String)) {
        nameLabel.text = "의뢰인: \(estimate.0)"
        quoteLabel.text = "견적: \(estimate.1)"
        dateLabel.text = "날짜: \(estimate.2)"
    }
}

