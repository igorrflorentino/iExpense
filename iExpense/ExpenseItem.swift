//
//  File.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

import Foundation
import SwiftData

@Model
class ExpenseItem{
	let name: String
	let type: String
	let amount: Double
	
	static let allTypes = ["Personal", "Business"]
	
	init(name: String, type: String, amount: Double) {
		self.name = name
		self.type = type
		self.amount = amount
	}
	
	static let sampleItems = [
		ExpenseItem(name: "Coffee", type: "Personal", amount: 5),
		ExpenseItem(name: "Groceries", type: "Business", amount: 50)
	]
}


