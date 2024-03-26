//
//  AddView.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

import SwiftUI

struct AddView: View {
	
	@State private var expenseDescription = ""
	@State private var expenseAmount = 0.0
	@State private var expenseType = allTypes[0]
	@State var expenses: Expenses
	
	@Environment(\.dismiss) var dismiss
	
	static private let allTypes = ["Personal", "Business"]
    
	var body: some View {
		NavigationStack{
			VStack{
				Form{
					TextField("description", text: $expenseDescription)
					TextField("amount", value: $expenseAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
						.keyboardType(.decimalPad)
					Picker("type", selection: $expenseType) {
						ForEach(Self.allTypes, id: \.self){
							Text($0)
						}
					}
				}
			}
			.navigationTitle("Add new item")
			.toolbar(content: {
				Button("Save") {
					expenses.allItens.append(ExpenseItem(name: expenseDescription, type: expenseType, amount: expenseAmount))
                    dismiss()
				}
			})
		}
    }
}

#Preview {
    AddView(expenses: Expenses())
}
