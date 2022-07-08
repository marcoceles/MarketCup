//
//  CoinChartViewModel.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation

class CoinChartViewModel : ObservableObject {

	private var id: String

	private let chartService = MarketChartService()

	@Published var state: NetworkState<MarketChart> = .initial

	init(id: String) {
		self.id = id
	}

	func loadData() {

		Task(priority: .background) {
			let result = await chartService.getData(with: id,
													currency: "eur",
													days: 7,
													interval: "hourly")
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.state = .success(response)
				case .failure(let error):
					self.state = .apiError(error)
				}
			}
		}
	}

}
