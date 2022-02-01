//
//  ViewController.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    static let usdBoxView = CustomCurrencyView(label: "USD")
    let eurBoxView = CustomCurrencyView(label: "EUR")
    let gbpBoxView = CustomCurrencyView(label: "GBP")
    
    var topBoxView = CustomCollectionView()
    var bottomBoxView = CustomCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(topBoxView)
        setupView() 
    }
    
    func setupView() {
        
        title = "Exchange"
        view.backgroundColor = .white
        let constraints = [
            topBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBoxView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topBoxView.heightAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)
    }


}

