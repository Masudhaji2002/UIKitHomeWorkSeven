//
//  ViewController.swift
//  UIKitHomeWorkSeven
//
//  Created by Масуд Гаджиев on 07.12.2024.
//

import UIKit

protocol ControllerProtocol: AnyObject {
    func setupConstr()
}

protocol ViewControllerProtocol: ControllerProtocol {
    var scrollView: UIScrollView { get set }
    var scrollViewContent: UIView { get set }
}

class ViewController: UIViewController, ViewControllerProtocol {
    
    let tableData = CardModel.allCards
    
    lazy var scrollView: UIScrollView = {
        $0.contentInsetAdjustmentBehavior = .never
        $0.backgroundColor = .white
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(scrollViewContent)
        //$0.delegate = self
        return $0
    }(UIScrollView())
    
    
    lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.addSubview(tableViewCard)
        return $0
    }(UIView())
    
    // Таблица
    lazy var tableViewCard: UITableView = {
        $0.dataSource = self
        $0.register(CardView.self, forCellReuseIdentifier: CardView.identifier)
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        setupConstr()
    }
    
    func setupConstr() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            tableViewCard.topAnchor.constraint(equalTo: scrollViewContent.topAnchor),
            tableViewCard.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 30),
            tableViewCard.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -30),
            tableViewCard.bottomAnchor.constraint(equalTo: scrollViewContent.bottomAnchor)
            
        ])
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CardView.identifier, for: indexPath) as? CardView else {
            fatalError("Unable to dequeue CardView")
        }
        let card = tableData[indexPath.row]
        cell.setupCell(card: card)
        cell.onShowButtonTapped = { [weak self] in
                    guard let self = self else { return }
                    let vc = SecondViewController(card: card)
                    self.navigationController?.pushViewController(vc, animated: true)
                }
        cell.selectionStyle = .none
        return cell
    }
}
