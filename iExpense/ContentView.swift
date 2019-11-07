//
//  ContentView.swift
//  iExpense
//
//  Created by dominator on 07/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

//structure to store info of or expense
struct Expense: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject{
    @Published var items = [Expense]()
}

struct ContentView: View {
    @ObservedObject private var expenses = Expenses()
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(expenses.items){
                        Text($0.name)
                    }.onDelete(perform: deleteExpense)
                }
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: addExpense){
                    Image(systemName: "plus")
                }
            )
        }
    }
    
    func addExpense(){
        expenses.items.append(Expense(name: "test", type: "Business", amount: 1000))
    }
    
    func deleteExpense(offset: IndexSet){
        expenses.items.remove(atOffsets: offset)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
