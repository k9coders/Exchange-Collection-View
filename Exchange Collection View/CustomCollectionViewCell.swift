//
//  CustomCollectionViewCell.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 31.01.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CustomCollectionViewCell"
    
    var currencyNameLabel = UILabel()
    var currentBalanceLabel = UILabel()
    var exchangeRateLabel = UILabel()
    var amountTextField = UITextField()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(currencyNameLabel)
        addSubview(currentBalanceLabel)
        addSubview(exchangeRateLabel)
        addSubview(amountTextField)
        
        setupView()
        setConstraints()
      
    }
    
    func setupView() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        layer.cornerRadius = 15
        
        // currencyName setup
        currencyNameLabel.text = "000"
        currencyNameLabel.font = UIFont(name: "Futura-CondensedMedium", size: 80)
        currencyNameLabel.textColor = .black
        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //currentBalance setup
        currentBalanceLabel.text = "You have: 100$"
        currentBalanceLabel.font = UIFont(name: "Futura-CondensedMedium", size: 20)
        currentBalanceLabel.textColor = .black
        currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //excchangeRate setup
        exchangeRateLabel.text = "$1 = $1"
        exchangeRateLabel.font = UIFont(name: "Futura-CondensedMedium", size: 20)
        exchangeRateLabel.textColor = .black
        exchangeRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //textFieldValue setup
        amountTextField.placeholder = "0.00"
        amountTextField.font = UIFont(name: "Futura-CondensedMedium", size: 80)
        amountTextField.textColor = .black
        amountTextField.translatesAutoresizingMaskIntoConstraints = false
        amountTextField.textAlignment = .right
        amountTextField.keyboardType = .numberPad
    }
    
    func setConstraints() {
        
        let constraints = [
            currencyNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            currencyNameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 110),
            currencyNameLabel.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            
            currentBalanceLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            currentBalanceLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            exchangeRateLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            exchangeRateLabel.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            amountTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            amountTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
