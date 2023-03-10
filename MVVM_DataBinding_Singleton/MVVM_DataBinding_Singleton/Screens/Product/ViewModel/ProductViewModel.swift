//
//  ProductViewModel.swift
//  MVVM_DataBinding_Singleton
//
//  Created by Alessio Di Nardo on 09/01/23.
//

import Foundation

final class ProductViewModel {
    
    var products: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)? //Data Binding Closure

    func fetchProducts() {
        self.eventHandler?(.loading)
        APIManager.shared.request(
            modelType: [Product].self,
            type: EndPointItems.products) { response in
                self.eventHandler?(.stopLoading)
                switch response {
                    case .success(let products):
                        self.products = products
                        self.eventHandler?(.dataLoaded)
                    case .failure(let error):
                        print(error)
                        self.eventHandler?(.error(error))
                }
        }
    }
    
//    func fetchProducts() {
//        self.eventHandler?(.loading)
//        APIManager.shared.fetchProducts { response in
//            self.eventHandler?(.stopLoading)
//            switch response {
//            case .success(let products):
//                self.products = products
//                self.eventHandler?(.dataLoaded)
//            case .failure(let error):
//                print(error)
//                self.eventHandler?(.error(error))
//            }
//        }
//    }
    
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
