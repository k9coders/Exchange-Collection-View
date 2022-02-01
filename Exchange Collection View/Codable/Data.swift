//
//  Data.swift
//  Exchange Collection View
//
//  Created by Oleg Shum on 01.02.2022.
//

import Foundation

struct Data: Codable {
    var base: String
    var date: String
    var rates: Rates
}
