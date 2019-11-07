//
//  ContentView.swift
//  iExpense
//
//  Created by dominator on 07/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject private var expenses = Expenses()
    @State var showingAddExpense = false

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
                .sheet(isPresented: $showingAddExpense) {
                    AddView(expenses: self.expenses)
            }
        }
    }
    
    func addExpense(){
        showingAddExpense = true
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
