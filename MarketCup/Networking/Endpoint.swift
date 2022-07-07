//
//  Endpoint.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

protocol Endpoint {

	var baseURL: String { get }
	var path: String { get }
	var method: RequestMethod { get }
}

extension Endpoint {
	var baseURL: String {
		return "https://api.coingecko.com/api/v3/"
	}
}
