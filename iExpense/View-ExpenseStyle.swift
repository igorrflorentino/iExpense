//
//  View-ExpenseStyle.swift
//  iExpense
//
//  Created by Igor Florentino on 22/03/24.
//

import SwiftUI
import SwiftData

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
	do {
		let config = ModelConfiguration(isStoredInMemoryOnly: true)
		let container = try ModelContainer(for: ExpenseItem.self, configurations: config)
		let expenseItemSample = ExpenseItem.sampleItems[0]
		return Text(expenseItemSample.amount.formatted(.currency(code: "USD")))
			.stylizeAmount(for: expenseItemSample.amount)
			.modelContainer(container)
	} catch {
		return Text("Failed to build container: \(error.localizedDescription)")
	}
}
