//
//  CustomCollectionViewCell.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 28.01.2022.
//

import UIKit

class CustomCollectionView: UICollectionView {
    
    var cells = [CurrencyViewModel]()
    
    
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
//        backgroundColor = .green
        delegate = self
        dataSource = self
        register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseId)
        isPagingEnabled = true
        layout.minimumLineSpacing = 20
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 150)
        contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        translatesAutoresizingMaskIntoConstraints = false
    
    }
     
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setModel(cells: [CurrencyViewModel]) {
        self.cells = cells
    }
}



extension CustomCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseId, for: indexPath) as! CustomCollectionViewCell
        cell.currencyNameLabel.text = cells[indexPath.row].currencyName
        return cell
    }
    
}
