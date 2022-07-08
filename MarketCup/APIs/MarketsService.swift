//
//  MarketsService.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

enum MarketsEndpoint {
	case getMarkets(currency: String,
					order: MarketsOrder,
					limit: Int,
					page: Int)
}

extension MarketsEndpoint: Endpoint {
	
	var path: String {
		switch self {
		case .getMarkets(let currency,
						 let order,
						 let limit,
						 let page):
			return "coins/markets?vs_currency=\(currency)&order=\(order.rawValue)&per_page=\(limit)&page=\(page)"
		}

	}

	var method: RequestMethod {
		return .get
	}
}

struct MarketsService: NetworkService {

	func getMarkets(with currency: String,
					order: MarketsOrder,
					limit: Int,
					page: Int) async -> Result<[Market], APIError> {

			return await sendRequest(endpoint: MarketsEndpoint.getMarkets(currency: currency,
																		  order: order,
																		  limit: limit,
																		  page: page),
									 responseModel: [Market].self)
	}
}
