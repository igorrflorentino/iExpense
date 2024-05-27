//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

import SwiftUI
import SwiftData

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
		}
		.modelContainer(for: ExpenseItem.self)
    }
}
