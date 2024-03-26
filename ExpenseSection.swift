//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Igor Florentino on 26/03/24.
//

import SwiftUI

struct ExpenseSection: View {
	
	let title: String
	let filteredItens: [ExpenseItem]
	let removeUsing: (IndexSet) -> Void
	
    var body: some View {
		Section(title){
			ForEach(filteredItens){ item in
				HStack{
					VStack(alignment: .leading){
						Text(item.name)
							.font(.headline)
					}
					Spacer()
					Text(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
						.stylizeAmount(for: item.amount)
				}
			}
			.onDelete(perform: removeUsing)
		}
    }
}

#Preview {
	let titleSample = String()
	let filteredItensSample = [ExpenseItem]()
	let removeUsingSample: (IndexSet) -> Void = { _ in }
    return ExpenseSection(title: titleSample, filteredItens: filteredItensSample, removeUsing: removeUsingSample)
}
