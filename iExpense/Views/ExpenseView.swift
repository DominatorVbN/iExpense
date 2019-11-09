//
//  ExpenseView.swift
//  iExpense
//
//  Created by dominator on 09/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

struct ExpenseView: View {
    let item: Expense
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.name)
                    .font(.headline)
                    .foregroundColor(Color.primary)
                Text(item.type)
                .foregroundColor(Color.secondary)
            }
            Spacer()
            Text("$")+Text("\(item.amount)")
        }.addRoudedBackgroud()
    }
}

struct ExpenseView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseView(item: Expense(name: "Example expense", type: "Personnel", amount: 1000))
    }
}
