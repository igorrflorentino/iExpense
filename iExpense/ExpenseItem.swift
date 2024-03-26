//
//  File.swift
//  iExpense
//
//  Created by Igor Florentino on 18/03/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable{
	var id = UUID()
	let name:String
	let type:String
	let amount: Double
}

@Observable
class Expenses {
	
	var allItens = [ExpenseItem]() {
		didSet{
			if let itensJSON = try? JSONEncoder().encode(allItens){
				UserDefaults.standard.set(itensJSON, forKey: "itens")
			}
		}
	}
	
	var personalItens: [ExpenseItem] {
		allItens.filter{ $0.type == "Personal"}
	}
	var businessItens: [ExpenseItem] {
		allItens.filter{ $0.type == "Business"}
	}
	
	init(){
		if let itensJSON = UserDefaults.standard.data(forKey: "itens"){
			if let decodedItens = try? JSONDecoder().decode([ExpenseItem].self, from: itensJSON){
				allItens = decodedItens
				return
			}
		}
		allItens = []
	}
	
}

