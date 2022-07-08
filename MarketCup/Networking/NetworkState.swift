//
//  NetworkState.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

enum NetworkState<T> {

	case initial
	case loading
	case success(T)
	case noResults
	case apiError(APIError)
}
