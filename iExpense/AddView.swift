//
//  AddView.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

import SwiftUI

struct AddView: View {
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss
	
	@State private var expenseDescription = "New Expense"
	@State private var expenseAmount = 0.0
	@State private var expenseType = allTypes[0]
	
	static private let allTypes = ExpenseItem.allTypes
	
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
						let newItem = ExpenseItem(name: expenseDescription, type: expenseType, amount: expenseAmount)
						modelContext.insert(newItem)
						dismiss()
					}
				}
			}
		}
	}
}

#Preview {
	AddView()
}
