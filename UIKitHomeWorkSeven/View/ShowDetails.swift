//
//  ShowDetails.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 08.12.2024.
//

import UIKit

class ShowDetails: UITableViewCell {
    
    static let identifier: String = "ShowDetails"
    
    private lazy var uiView = {
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var hStack = CustomStack(axis: .horizontal, distribution: .fillProportionally)
    
    private lazy var headerImage = CustomImage(cornerRadius: 10)
    
    private lazy var titleLabel = CustomLabel(font: .boldSystemFont(ofSize: 20), textColor: .black)
    private lazy var dateLabel = CustomLabel(font: .systemFont(ofSize: 14, weight: .light), textColor: .black, alignment: .right)
    private lazy var descriptionLabel = CustomLabel(font: .systemFont(ofSize: 14, weight: .light), textColor: .black)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addUISubviews()
    }
    
    private func addUISubviews() {
        contentView.addSubview(uiView)
        uiView.addSubviews(views: headerImage, hStack, descriptionLabel)
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(dateLabel)
        
        setupConstraint()
    }
    
     func setupCell(card: CardModel) {
        headerImage.image = UIImage(named: card.headerImage)
        titleLabel.text = card.title
        dateLabel.text = card.date
        descriptionLabel.text = card.descriptionFull
    }
    
    private func setupConstraint() {
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: contentView.topAnchor),
            uiView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            uiView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            uiView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            
            headerImage.topAnchor.constraint(equalTo: uiView.topAnchor),
            headerImage.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 30),
            headerImage.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -30),
            headerImage.heightAnchor.constraint(equalToConstant: 170),
            
            hStack.topAnchor.constraint(equalTo: headerImage.bottomAnchor, constant: 25),
            hStack.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 30),
            hStack.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -30),
            
            descriptionLabel.topAnchor.constraint(equalTo: hStack.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: uiView.leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: uiView.trailingAnchor, constant: -30),
            descriptionLabel.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
