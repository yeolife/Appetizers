//
//  Appetizer.swift
//  Appetizers
//
//  Created by yeolife on 9/30/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let protein: Int
    let calories: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppletizer = Appetizer(id: 001,
                                            name: "Test Appetizer",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            price: 9.99,
                                            imageURL: "",
                                            protein: 99,
                                            calories: 99,
                                            carbs: 99)
    
    static let appetizers = [sampleAppletizer, sampleAppletizer, sampleAppletizer]
    
    static let orderItemOne = Appetizer(id: 0001,
                                            name: "Test Appetizer One",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            price: 9.99,
                                            imageURL: "",
                                            protein: 99,
                                            calories: 99,
                                            carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 0002,
                                            name: "Test Appetizer Two",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            price: 9.99,
                                            imageURL: "",
                                            protein: 99,
                                            calories: 99,
                                            carbs: 99)
    
    static let orderItemThree = Appetizer(id: 0003,
                                            name: "Test Appetizer Three",
                                            description: "This is the description for my appetizer. It's yummy.",
                                            price: 9.99,
                                            imageURL: "",
                                            protein: 99,
                                            calories: 99,
                                            carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
