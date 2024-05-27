//
//  ContentView.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//


import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) var modelContext
	
	@State private var showingAddExpense = false
	@State private var sort = [SortDescriptor(\ExpenseItem.name)]
	@State private var type = "All"
	
	var body: some View {
		NavigationStack{
			ExpensesList(type: type, sort: sort)
				.navigationTitle("iExpense")
				.toolbar(content: {
					NavigationLink(destination: AddView()) {
						Image(systemName: "plus")
					}
					Menu("sort", systemImage: "arrow.up.arrow.down"){
						Picker("sort", selection: $sort) {
							Text("Sort by name")
								.tag([SortDescriptor(\ExpenseItem.name)])
							Text("Sort by amount")
								.tag([SortDescriptor(\ExpenseItem.amount)])
						}
					}
					Menu("filter", systemImage: "line.horizontal.3.decrease"){
						Picker("filter", selection: $type) {
							Text("Show all")
								.tag("All")
							Divider()
							ForEach(ExpenseItem.allTypes, id: \.self) {
								Text($0)
							}
						}
					}
				})
		}
	}
}

#Preview {
	ContentView()
		.modelContainer(for: ExpenseItem.self)
}
