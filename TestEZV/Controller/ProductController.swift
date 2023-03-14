//
//  ViewModel.swift
//  TestEZV
//
//  Created by Kevin  Sam Andaria on 14/03/23.
//

import Foundation

class ProductController: ObservableObject {
    @Published var productList: [Product] = [Product]()
    
    func fetchData(completionHandler: @escaping(DataResponse) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
            let task = URLSession.shared.dataTask(with: request) { data, result, error in
                guard let data = data, error == nil else {
                    print("error when get the data")
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(DataResponse.self, from: data)
                    completionHandler(result)
                } catch {
                    print("ERROR \(error)")
                }
            }
            task.resume()
    }
    
    func loadDataFromApi() {
            self.fetchData { products in
                for product in products.products {
                    let temp = Product(id: product.id, title: product.title, description: product.description, price: product.price, discountPercentage: product.discountPercentage, rating: product.rating, brand: product.brand, thumbnail: product.thumbnail, images: product.images)
                    
                    self.productList.append(temp)
                }
            }
    }
}
