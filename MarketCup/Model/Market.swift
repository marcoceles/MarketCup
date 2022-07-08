//
//  Market.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

struct Market: Decodable, Identifiable {
	let id: String
	let	symbol: String?
	let name: String?
	let image: String?
	let currentPrice: Double?
	let marketCap: Int?
	let marketCapRank: Int?
	let fullyDilutedValuation: Int?
	let totalVolume: Int?
	let high24H: Double?
	let	low24H: Double?
	let	priceChange24H: Double?
	let	priceChangePercentage24H : Double?
	let marketCapChange24H: Double?
	let marketCapChangePercentage24H: Double?
	let	circulatingSupply: Double?
	let totalSupply: Double?
	let maxSupply: Int?
	let ath: Double?
	let	athChangePercentage: Double?
	let athDate: String?
	let atl: Double?
	let	atlChangePercentage: Double?
	let atlDate: String?
	let roi: Roi?
	let lastUpdated: String?

	enum CodingKeys: String, CodingKey {
		case id, symbol, name, image
		case currentPrice = "current_price"
		case marketCap = "market_cap"
		case marketCapRank = "market_cap_rank"
		case fullyDilutedValuation = "fully_diluted_valuation"
		case totalVolume = "total_volume"
		case high24H = "high_24h"
		case low24H = "low_24h"
		case priceChange24H = "price_change_24h"
		case priceChangePercentage24H = "price_change_percentage_24h"
		case marketCapChange24H = "market_cap_change_24h"
		case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
		case circulatingSupply = "circulating_supply"
		case totalSupply = "total_supply"
		case maxSupply = "max_supply"
		case ath
		case athChangePercentage = "ath_change_percentage"
		case athDate = "ath_date"
		case atl
		case atlChangePercentage = "atl_change_percentage"
		case atlDate = "atl_date"
		case roi
		case lastUpdated = "last_updated"
	}
	
	static var preview: Market {
		return Market(id: "CelesCoin", symbol: nil, name: "CelesCoin", image: nil, currentPrice: nil, marketCap: nil, marketCapRank: nil, fullyDilutedValuation: nil, totalVolume: nil, high24H: nil, low24H: nil, priceChange24H: nil, priceChangePercentage24H: nil, marketCapChange24H: nil, marketCapChangePercentage24H: nil, circulatingSupply: nil, totalSupply: nil, maxSupply: nil, ath: nil, athChangePercentage: nil, athDate: nil, atl: nil, atlChangePercentage: nil, atlDate: nil, roi: nil, lastUpdated: nil)
	}
}
