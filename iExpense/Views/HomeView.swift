//
//  ContentView.swift
//  iExpense
//
//  Created by dominator on 07/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var expenses = Expenses()
    @State var showingAddExpense = false
    var shouldShowEmptyState: Bool{
        return expenses.items.count == 0
    }
    var body: some View {
        NavigationView{
            VStack{
                if shouldShowEmptyState{
                    ExpenseEmptyView(addExpense: $showingAddExpense)
                }else{
                    List{
                        ForEach(expenses.items){ item in
                            ExpenseView(item: item)
                        }.onDelete(perform: deleteExpense)
                    }
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
        HomeView()
    }
}
