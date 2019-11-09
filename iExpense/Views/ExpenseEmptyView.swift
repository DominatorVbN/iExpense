//
//  ExpenseEmptyView.swift
//  iExpense
//
//  Created by dominator on 09/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

struct ExpenseEmptyView: View {
    @Binding var addExpense: Bool
    var body: some View {
        VStack{
            Image(systemName: "square.stack.3d.up.slash")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.gray)
            Text("No Expenses Yet!").font(.headline)
                .foregroundColor(Color.secondary)
                .padding(.top, 40)
            Button(action: {
                self.addExpense = true
            }) {
                Text("Add Expense")
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.accentColor)
                )
                    .foregroundColor(.white)
            }.padding(.top, 20)
        }
    }
}

struct ExpenseEmptyView_Previews: PreviewProvider {
    @State static var addExpense = true
    static var previews: some View {
        ExpenseEmptyView(addExpense: $addExpense)
    }
}
