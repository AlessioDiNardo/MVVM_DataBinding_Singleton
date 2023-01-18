//
//  EndPointType.swift
//  MVVM_DataBinding_Singleton
//
//  Created by Alessio Di Nardo on 10/01/23.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var methos: HTTPMethods { get }
}

enum EndPointItems {
    case products
}

// https://fakestoreapi.com/products
extension EndPointItems: EndPointType {
    
    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var methos: HTTPMethods {
        switch self {
        case .products:
            return .get
        }
    }
    
    
}
