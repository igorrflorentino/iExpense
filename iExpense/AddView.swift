//
//  AddView.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

import SwiftUI

struct AddView: View {
	
	@State private var expenseDescription = "New Expense"
	@State private var expenseAmount = 0.0
	@State private var expenseType = allTypes[0]
	@State var expenses: Expenses
	
	@Environment(\.dismiss) var dismiss
	
	static private let allTypes = ["Personal", "Business"]
	
	var body: some View {
		NavigationStack {
			VStack {
				Form {
					TextField("amount", value: $expenseAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
						.keyboardType(.decimalPad)
					Picker("type", selection: $expenseType) {
						ForEach(Self.allTypes, id: \.self) {
							Text($0)
						}
					}
				}
			}
			.navigationTitle($expenseDescription)
			.navigationBarBackButtonHidden()
	    	.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button("Cancel", role: .cancel) {
						dismiss()
					}
				}
				ToolbarItem(placement: .confirmationAction) {
					Button("Save") {
						expenses.allItens.append(ExpenseItem(name: expenseDescription, type: expenseType, amount: expenseAmount))
						dismiss()
					}
				}
			}
		}
	}
}

// Preview provider, assuming you have a preview environment set up
struct AddView_Previews: PreviewProvider {
	static var previews: some View {
		AddView(expenses: Expenses())
	}
}
