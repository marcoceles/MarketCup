//
//  MarketChartService.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation

enum MarketChartEndpoint {
	case getData(id: String,
				 currency: String,
				 days: Int,
				 interval: String)
}

extension MarketChartEndpoint: Endpoint {

	var path: String {
		switch self {
		case .getData(let id,
					  let currency,
					  let days,
					  let interval):
			return "coins/\(id)/market_chart?vs_currency=\(currency)&days=\(days)&interval=\(interval)"
		}

	}

	var method: RequestMethod {
		return .get
	}
}

struct MarketChartService: NetworkService {

	func getData(with id: String,
				 currency: String,
				 days: Int,
				 interval: String) async -> Result<MarketChart, APIError> {

		return await sendRequest(endpoint: MarketChartEndpoint.getData(id: id,
																	   currency: currency,
																	   days: days,
																	   interval: interval),
								 responseModel: MarketChart.self)
	}
}
