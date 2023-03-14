//
//  ProductModel.swift
//  TestEZV
//
//  Created by Kevin  Sam Andaria on 14/03/23.
//

import Foundation

struct DataResponse: Codable {
    var products: [Product]
    var total: Int
    var skip: Int
    var limit: Int
}


struct Product: Codable {
    var id: Int
    var title: String
    var description: String
    var price: Int
    var discountPercentage: Double
    var rating: Double
    var brand: String
    var thumbnail: String
    var images: [String]
}
