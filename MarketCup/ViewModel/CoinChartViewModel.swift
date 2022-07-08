//
//  CoinChartViewModel.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation
import LineChartView

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

	func normalizeChartData(marketChart: MarketChart) -> [LineChartData]{
		let chartData = marketChart.prices.compactMap {
			LineChartData($0.last ?? 0.0,
						  timestamp: Date(timeIntervalSince1970: TimeInterval($0.first ?? 0) / 1000),
						  label: Date(timeIntervalSince1970: TimeInterval($0.first ?? 0) / 1000).formatted(date: .abbreviated, time: .shortened))
		}
		return chartData
	}

}
