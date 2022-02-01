//
//  CustomCollectionViewCell.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 31.01.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
     static let reuseId = "CustomCollectionViewCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(mainImageView)
        
        let constraints = [
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        mainImageView.topAnchor.constraint(equalTo: topAnchor),
        mainImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
