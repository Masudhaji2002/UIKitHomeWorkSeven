//
//  CardView.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 07.12.2024.
//

import UIKit

class CardView: UITableViewCell {
    
    static let identifier: String = "CardView"
    
     var onShowButtonTapped: (() -> Void)?
    
    lazy var cardUIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 30

        return $0
    }(UIView())
    
    private lazy var hStack = CustomStack(axis: .horizontal, distribution: .fillEqually)
    
    private lazy var titleText = CustomLabel()
    private lazy var descriptionText = CustomLabel(font: .systemFont(ofSize: 14))
    private lazy var headerImage = CustomImage(cornerRadius: 30)
    
    private lazy var imageOne = CustomImage(cornerRadius: 20)
    private lazy var imageTwo = CustomImage(cornerRadius: 20)
    private lazy var imageThird = CustomImage(cornerRadius: 20)
    
    private lazy var showButton = {
        $0.backgroundColor = .black
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 30
        $0.setTitle("show details", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUI()
        
    }
    
    private func addUI() {
        contentView.addSubview(cardUIView)
        cardUIView.addSubviews(views: headerImage, titleText, descriptionText, hStack, showButton)
        hStack.addArrangedSubview(imageOne)
        hStack.addArrangedSubview(imageTwo)
        hStack.addArrangedSubview(imageThird)

        setupConstraint()
        
    }

    
    func setupCell(card: CardModel) {
        titleText.text = card.title
        descriptionText.text = card.description
        headerImage.image = UIImage(named: card.headerImage)
        imageOne.image = UIImage(named: card.imageOne)
        imageTwo.image = UIImage(named: card.imageTwo)
        imageThird.image = UIImage(named: card.imageThird)
        
    }

    @objc func showDetails() {
        onShowButtonTapped?()
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            cardUIView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardUIView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cardUIView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cardUIView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            headerImage.topAnchor.constraint(equalTo: cardUIView.topAnchor, constant: 15),
            headerImage.leadingAnchor.constraint(equalTo: cardUIView.leadingAnchor, constant: 25),
            headerImage.trailingAnchor.constraint(equalTo: cardUIView.trailingAnchor, constant: -25),
            headerImage.heightAnchor.constraint(equalToConstant: 160),
            
            titleText.topAnchor.constraint(equalTo: headerImage.topAnchor, constant: 70),
            titleText.leadingAnchor.constraint(equalTo: headerImage.leadingAnchor, constant: 20),
            titleText.trailingAnchor.constraint(equalTo: headerImage.trailingAnchor, constant: -20),
            titleText.bottomAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: -70),
            
            descriptionText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 10),
            descriptionText.leadingAnchor.constraint(equalTo: headerImage.leadingAnchor, constant: 20),
            descriptionText.trailingAnchor.constraint(equalTo: headerImage.trailingAnchor, constant: -20),
            

            
            hStack.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 12),
            hStack.leadingAnchor.constraint(equalTo: cardUIView.leadingAnchor, constant: 25),
            hStack.trailingAnchor.constraint(equalTo: cardUIView.trailingAnchor, constant: -25),
            hStack.heightAnchor.constraint(equalToConstant: 100),
            
            showButton.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 16),
            showButton.leadingAnchor.constraint(equalTo: cardUIView.leadingAnchor, constant: 25),
            showButton.trailingAnchor.constraint(equalTo: cardUIView.trailingAnchor, constant: -25),
            showButton.bottomAnchor.constraint(equalTo: cardUIView.bottomAnchor, constant: -15),
            showButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
