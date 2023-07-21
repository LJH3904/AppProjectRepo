import UIKit

class ThirdViewController: UIViewController {
    let estimates = [
        ("이희찬", "1억", "2023-07-21"),
        ("남현정", "2억", "2023-07-21"),
        ("이제현", "3억", "2023-07-21"),
        ("임혜인", "4억", "2023-07-21"),
        ("최하늘", "5억", "2023-07-21")
    ]
    
    let requestedEstimate = ("알코홀릭", "소주, 맥주, 막걸리 100병씩 주세요", "2023-07-21")
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        buildInterface()
        setupConstraints()
    }
    
    func setupBarButton() {
        let sortButton = UIBarButtonItem(image: UIImage(systemName: "arrow.up.arrow.down"), style: .plain, target: self, action: #selector(sortButtonTapped))
        navigationItem.rightBarButtonItem = sortButton
    }
    
    @objc func sortButtonTapped() {
        //정렬
    }
    
    func buildInterface() {
        navigationItem.title = "견적내역"
        setupBarButton()
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.spacing = 10
        
        let requestedCardView = RequestedCardView()
        requestedCardView.configure(with: requestedEstimate)
        stackView.addArrangedSubview(requestedCardView)
        
        for estimate in estimates {
            let cardView = CardView()
            cardView.configure(with: estimate)
            stackView.addArrangedSubview(cardView)
        }
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
