//
//  CoinDetailService.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation

enum CoinDetailEndpoint {
	case getDetail(id: String)
}

extension CoinDetailEndpoint: Endpoint {

	var path: String {
		switch self {
		case .getDetail(let id):
			return "coins/\(id)"
		}

	}

	var method: RequestMethod {
		return .get
	}
}

struct CoinDetailService: NetworkService {

	func getCoinDetail(for id: String) async -> Result<CoinDetail, APIError> {

		return await sendRequest(endpoint: CoinDetailEndpoint.getDetail(id: id),
								 responseModel: CoinDetail.self)
	}
}
