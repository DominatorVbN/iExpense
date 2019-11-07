//
//  Expenses.swift
//  iExpense
//
//  Created by dominator on 08/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

//structure to store info of or expense
struct Expense: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject{
    @Published var items = [Expense](){
        didSet{
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(items){
                UserDefaults.standard.set(data, forKey: "items")
            }
        }
    }
    init(){
        let decoder = JSONDecoder()
        
        if let items = UserDefaults.standard.data(forKey: "items"){
            if let actualItems = try? decoder.decode([Expense].self, from: items){
                self.items = actualItems
                return
            }
        }
        
        self.items = []
    }
}
