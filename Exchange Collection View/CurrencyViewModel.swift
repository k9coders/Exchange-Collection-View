//
//  CurrencyViewModel.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 01.02.2022.
//

import UIKit

struct CurrencyViewModel {
    
    var currencyName: String
    var rate: Double
    
    static func fetchModel() -> [CurrencyViewModel] {
        
        let usd = CurrencyViewModel(currencyName: "USD", rate: ViewController.dataSource?.rates.USD ?? 0.0)
        let eur = CurrencyViewModel(currencyName: "EUR", rate: ViewController.dataSource?.rates.EUR ?? 0.0)
        let gbp = CurrencyViewModel(currencyName: "GBP", rate: ViewController.dataSource?.rates.GBP ?? 0.0)
        
        return [usd, eur, gbp]
    }
    
    
}
