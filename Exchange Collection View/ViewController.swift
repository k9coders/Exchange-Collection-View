//
//  ViewController.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 28.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var topBoxView = CustomCollectionView()
    var bottomBoxView = CustomCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(topBoxView)
        view.addSubview(bottomBoxView)
        setupView()
        topBoxView.setModel(cells: CurrencyViewModel.fetchModel())
        bottomBoxView.setModel(cells: CurrencyViewModel.fetchModel())
    }
    
    func setupView() {
        
        title = "Exchange"
        view.backgroundColor = .white
        let constraints = [
            topBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topBoxView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topBoxView.heightAnchor.constraint(equalToConstant: 150),
            
            bottomBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBoxView.topAnchor.constraint(equalTo: view.topAnchor, constant: 350),
            bottomBoxView.heightAnchor.constraint(equalToConstant: 150),
            
        ]
        NSLayoutConstraint.activate(constraints)
    }


}

