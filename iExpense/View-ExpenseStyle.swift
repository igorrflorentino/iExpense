//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Igor Florentino on 22/03/24.
//

import SwiftUI


struct AmountStyle: ViewModifier {
	
	let amount: Double
	
	func body(content: Content) -> some View {
		switch amount{
		case 0..<10:
			content
				.foregroundStyle(.gray)
		case 10..<100:
			content
				.foregroundStyle(.primary)
		default:
			content
				.font(.title3)
		}
	}
}


extension View {
	func stylizeAmount(for amount: Double) -> some View {
		modifier(AmountStyle(amount: amount))
	}
}

#Preview {
	let expenseItemSample = ExpenseItem(name: "", type: "", amount: 10.4)
	return Text(expenseItemSample.amount.formatted(.currency(code: "USD")))
		.stylizeAmount(for: expenseItemSample.amount)
}
