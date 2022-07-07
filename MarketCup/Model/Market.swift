//
//  Market.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

struct Market {
	let id: String
	let	symbol: String
	let name: String
	let image: String
	let currentPrice: Double
	let marketCap: Int
	let marketCapRank: Int
	let fullyDilutedValuation: Int?
	let totalVolume: Int
	let high24H: Double
	let	low24H: Double
	let	priceChange24H: Double
	let	priceChangePercentage24H : Double
	let marketCapChange24H: Double
	let marketCapChangePercentage24H: Double
	let	circulatingSupply: Double
	let totalSupply: Double?
	let maxSupply: Int?
	let ath: Double
	let	athChangePercentage: Double
	let athDate: String
	let atl: Double
	let	atlChangePercentage: Double
	let atlDate: String
	let roi: Roi?
	let lastUpdated: String
}
