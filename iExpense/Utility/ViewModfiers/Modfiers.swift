//
//  Modfiers.swift
//  iExpense
//
//  Created by dominator on 09/11/19.
//  Copyright © 2019 dominator. All rights reserved.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(UIColor.systemGroupedBackground))
        )
            .shadow(color: Color.secondary, radius: 2)
        
    }
}

extension View{
    func addRoudedBackgroud()-> some View{
        return self.modifier(BackgroundModifier())
    }
}
