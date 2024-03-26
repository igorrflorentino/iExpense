//
//  ContentView.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

//import Foundation
//
//struct ExpenseItem {
//	var name:String
//	var type:String
//	var amount: Double
//}
//
//@Observable
//class Expenses {
//	var itens = [ExpenseItem]()
//}


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
				Button("add expense", systemImage: "plus") {
					showingAddExpense.toggle()
				}
			})
			.sheet(isPresented: $showingAddExpense, content: {
				AddView(expenses: expenses)
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
