//
//  CoinDetailViewModel.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation

class CoinDetailViewModel : ObservableObject {

	private var id: String

	private let detailService = CoinDetailService()

	@Published var state: NetworkState<CoinDetail> = .initial

	init(id: String) {
		self.id = id
	}

	func loadDetail() {

		Task(priority: .background) {
			let result = await detailService.getCoinDetail(for: id)
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
