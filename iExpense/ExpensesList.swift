//
//  ExpensesList.swift
//  iExpense
//
//  Created by Igor Florentino on 26/03/24.
//

import SwiftUI
import SwiftData

struct ExpensesList: View {
	
	@Environment(\.modelContext) var modelContext
	@Query var itens: [ExpenseItem]
	
	init(type: String, sort: [SortDescriptor<ExpenseItem>]) {
		_itens = Query(filter: #Predicate<ExpenseItem> { expense in
			if type != "All"{
				return expense.type == type
			} else {
				return true
			}
		}, sort: sort)
	}
		
	var body: some View {
		List{
			ForEach(itens){ item in
				HStack{
					VStack(alignment: .leading){
						Text(item.name)
							.font(.headline)
						Text(item.type)
							.font(.footnote)
					}
					Spacer()
					Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
						.stylizeAmount(for: item.amount)
				}
			}
			.onDelete(perform: deleteExpense)
		}
	}
	
	private func deleteExpense(offsets: IndexSet) {
		for index in offsets {
			modelContext.delete(itens[index])
		}
	}
}

#Preview {
	ExpensesList(type: "Personal", sort: [SortDescriptor(\ExpenseItem.name)])
		.modelContainer(for: ExpenseItem.self)
}
