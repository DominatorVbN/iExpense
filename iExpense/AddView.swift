//
//  AddView.swift
//  iExpense
//
//  Created by dominator on 08/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

struct AddView: View {
    var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personel"
    @State private var amount = ""
    
    static var types = ["Business", "Personel"]
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Expense Name", text: $name)
                
                Picker("Select Type", selection: $type) {
                    ForEach(AddView.types, id: \.self){
                        Text("\($0)")
                    }
                }
                
                TextField("Amount", text: $amount)
                    .keyboardType(.numberPad)
            }.navigationBarTitle("Add Expense")
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
