//
//  SecondViewController.swift
//  Prototype_LAB6
//
//  Created by LJh on 2023/07/20.
//

import UIKit

struct Chat {
    let name: String
    let messageContent: String
    let time: String
    //    let time: Time
}

// MARK: - SecondViewController - 채팅 목록
class SecondViewController: UIViewController {
    var chatList: [Chat] = [
        Chat(name: "라이나 생명", messageContent: "충전치료 소개 개수 제한 없는 라이나 치아보험", time: "2023-07-21"),
        Chat(name: "홍길동", messageContent: "연락 바랍니다.", time: "2023-07-21"),
        Chat(name: "행정안전부", messageContent: "연락 바랍니다.", time: "2023-07-21"),
        Chat(name: "인프런", messageContent: "건강 유의 바랍니다.", time: "2023-07-21"),
    ]
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "채팅 목록"
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ChatCell.self, forCellReuseIdentifier: ChatCell.reuseIdentifier)
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ChatCell.reuseIdentifier, for: indexPath) as! ChatCell
        let chat = chatList[indexPath.row]
        cell.nameLabel.text = chat.name
        cell.messageLabel.text = chat.messageContent
        cell.timeLabel.text = chat.time
        return cell
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedChat = chatList[indexPath.row]
        let chatViewController = ChatViewController()
        chatViewController.messages = [selectedChat]
        chatViewController.dealerName = selectedChat.name
        
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}

class ChatCell: UITableViewCell {
    let padding: CGFloat = 20
    static let reuseIdentifier = "ChatCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(messageLabel)
        contentView.addSubview(timeLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            
            messageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
        
        contentView.backgroundColor = UIColor.systemGray6
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}

// MARK: - ChatViewController - 1:1 채팅 화면
class ChatViewController: UIViewController {
    var messages: [Chat] = []
    var dealerName: String?
    let padding: CGFloat = 20
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(ChatMessageCell.self, forCellWithReuseIdentifier: ChatMessageCell.reuseIdentifier)
        return collectionView
    }()
    
    let messageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "메시지를 입력하세요."
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("보내기", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(dealerName ?? "")님"
        view.backgroundColor = .systemBackground
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ChatMessageCell.self, forCellWithReuseIdentifier: ChatMessageCell.reuseIdentifier)
        
        view.addSubview(collectionView)
        view.addSubview(messageTextField)
        view.addSubview(sendButton)
        
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: messageTextField.topAnchor, constant: -padding),
            
            messageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor),
            messageTextField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            messageTextField.heightAnchor.constraint(equalToConstant: 50),
            messageTextField.widthAnchor.constraint(lessThanOrEqualToConstant: view.bounds.width - sendButton.bounds.width),
            
            sendButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            sendButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            sendButton.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func sendButtonTapped() {
        guard let messageContent = messageTextField.text, messageContent != "" else { return }
        let newChat = Chat(name: "사용자", messageContent: messageContent, time: "2023-07-22")
        messages.append(newChat)
        messageTextField.text = ""
        collectionView.reloadData()
        
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    }
}

extension ChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChatMessageCell.reuseIdentifier, for: indexPath) as! ChatMessageCell
        let message = messages[indexPath.item]
        cell.messageLabel.text = message.messageContent
        cell.isMyMessage = message.name == "사용자" ? true : false
        return cell
    }
}

extension ChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let message = messages[indexPath.item]
        let messageSize = message.messageContent.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)])
        return CGSize(width: collectionView.bounds.width * 0.9, height: messageSize.height + 40)
    }
}

class ChatMessageCell: UICollectionViewCell {
    static let reuseIdentifier = "ChatMessageCell"
    let padding: CGFloat = 20
    let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    var isMyMessage: Bool = false {
        didSet {
            updateMessage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            //            messageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            //            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            //            messageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            //            messageLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        setMessage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    func setMessage() {
        contentView.backgroundColor = UIColor.systemGray5
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = true
    }
    
    func updateMessage() {
        if isMyMessage {
            contentView.backgroundColor = UIColor.systemBlue
            messageLabel.textColor = UIColor.white
        } else {
            contentView.backgroundColor = UIColor.systemGray5
            messageLabel.textColor = UIColor.black
        }
    }
}
