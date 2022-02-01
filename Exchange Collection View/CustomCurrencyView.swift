//
//  CustomCurrencyView.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 31.01.2022.
//

import UIKit

protocol CustomCurrencyViewDelegate: AnyObject {
    func editText(value: String)
}

class CustomCurrencyView: UIView {
    var currencyNameLabel = UILabel()
    var currentBalanceLabel = UILabel()
    var exchangeRateLabel = UILabel()
    var amountTextField = UITextField()
    
    var currencyLabel: String
    var delegate: CustomCurrencyViewDelegate?
    
//TODO: задать обязательные параметры
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupView()
//    }
    
    init(label: String) {
        self.currencyLabel = label
        super.init(frame: CGRect())
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        layer.cornerRadius = 15
        
        // currencyName setup
        currencyNameLabel.text = self.currencyLabel
        currencyNameLabel.font = UIFont(name: "Futura-CondensedMedium", size: 80)
        currencyNameLabel.textColor = .black
        currencyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //currentBalance setup
//        currentBalance.text = "You have: 100$"
        currentBalanceLabel.font = UIFont(name: "Futura-CondensedMedium", size: 20)
        currentBalanceLabel.textColor = .black
        currentBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //excchangeRate setup
//        exchangeRate.text = "$1 = $1"
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
        // addTarget
//        amountTextField.addTarget(self, action: #selector(ViewController.textField(_:shouldChangeCharactersIn:replacementString:)), for: .valueChanged)
        //test:
        amountTextField.addTarget(self, action: #selector(printTextValue(_:)), for: .editingChanged)

        
        addSubview(currencyNameLabel)
        addSubview(currentBalanceLabel)
        addSubview(exchangeRateLabel)
        addSubview(amountTextField)
        
        let constraints = [
            currencyNameLabel.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            currencyNameLabel.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: 100),
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
    
    @objc func printTextValue(_ textField: UITextField) {
        print("тест", textField.text)
        delegate?.editText(value: textField.text ?? "")
    }
    
}
