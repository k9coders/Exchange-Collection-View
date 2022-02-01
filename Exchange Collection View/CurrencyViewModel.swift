//
//  CurrencyViewModel.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 01.02.2022.
//

import UIKit

struct CurrencyViewModel {
    
    var currencyName: String
    
    static func fetchModel() -> [CurrencyViewModel] {
        
        let usd = CurrencyViewModel(currencyName: "USD")
        let eur = CurrencyViewModel(currencyName: "EUR")
        let gbp = CurrencyViewModel(currencyName: "GBP")
        
        return [usd, eur, gbp]
        
    }
}
