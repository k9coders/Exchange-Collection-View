//
//  CustomCollectionViewCell.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 28.01.2022.
//

import UIKit

class CustomCollectionView: UICollectionView {
    
//    let usdBoxView = CustomCurrencyView(label: "USD")
//    let eurBoxView = CustomCurrencyView(label: "EUR")
//    let gbpBoxView = CustomCurrencyView(label: "GBP")
    
    let cells = [CustomCurrencyView]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = .green
        delegate = self
        dataSource = self
        register(  CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        isPagingEnabled = true
        layout.minimumLineSpacing = 20
        contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        translatesAutoresizingMaskIntoConstraints = false
    
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
    }
}
