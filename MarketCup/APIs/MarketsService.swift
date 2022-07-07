//
//  MarketsService.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

struct MarketsEndpoint: Endpoint {
	
	var path: String {
		return "markets"
	}

	var method: RequestMethod {
		return .get
	}
}

struct MarketsService: NetworkService {

	func getMarkets(with request: MarketsRequest)
		async -> Result<[Market], APIError> {

			return await sendRequest(endpoint: MarketsEndpoint(),
									 body: request,
									 responseModel: [Market].self)
	}
}
