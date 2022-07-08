//
//  CoinListViewModel.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

class CoinListViewModel : ObservableObject {

	private let marketsService = MarketsService()

	@Published var state: NetworkState<[Market]> = .initial

	func loadMarkets() {
		let currencyCode = "eur"

		Task(priority: .background) {
			let result = await marketsService.getMarkets(with: currencyCode,
														 order: .marketCapDesc,
														 limit: 10,
														 page: 1)
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
