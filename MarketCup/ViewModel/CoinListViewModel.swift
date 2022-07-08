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
	@Published var markets: [Market] = [Market]()

	func loadMarkets() {
		let currentLocale = Locale.current
		let currentCurrencyCode = currentLocale.currencyCode ?? "eur"

		Task(priority: .background) {
			let result = await marketsService.getMarkets(with: currentCurrencyCode,
														 order: .marketCapDesc,
														 limit: 10,
														 page: 1)
			DispatchQueue.main.async {
				switch result {
				case .success(let response):
					self.state = .success(response)
					self.markets = response
				case .failure(let error):
					self.state = .apiError(error)
				}
			}
		}
	}

}
