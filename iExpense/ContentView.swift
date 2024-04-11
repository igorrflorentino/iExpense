//
//  ContentView.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//


import SwiftUI

struct ContentView: View {
	
	@State private var expenses = Expenses()
	@State private var showingAddExpense = false
	
    var body: some View {
		NavigationStack{
			List{
				ExpenseSection(title: "Personal", filteredItens: expenses.personalItens, removeUsing: removePersonalItems)
				ExpenseSection(title: "Business", filteredItens: expenses.businessItens, removeUsing: removeBusinessItems)
			}
			.navigationTitle("iExpense")
			.toolbar(content: {
				NavigationLink(destination: AddView(expenses: expenses)) {
					Image(systemName: "plus")
				}
			})
		}
    }
	
	func removeItems(at offSets: IndexSet, in UIArray: [ExpenseItem]){
		var originalOffsets = IndexSet()
		
		for offset in offSets{
			let itemToDelet = UIArray[offset]
			if let originalOffset = expenses.allItens.firstIndex(of:itemToDelet){
				originalOffsets.insert(originalOffset)
			}
		}
		
		expenses.allItens.remove(atOffsets: originalOffsets)
	}
	
	func removePersonalItems(at offSets: IndexSet){
		removeItems(at: offSets, in: expenses.personalItens)
	}
	
	func removeBusinessItems(at offSets: IndexSet){
		removeItems(at: offSets, in: expenses.businessItens)
	}
	
}

#Preview {
    ContentView()
}
