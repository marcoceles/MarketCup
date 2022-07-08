//
//  CoinDetail.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation

struct CoinDetail: Decodable {
	let id, symbol, name: String
	let coinDescription: CoinDescription
	let links: CoinLinks
	let image: CoinImage
	let marketCapRank: Int

	enum CodingKeys: String, CodingKey {
		case id, symbol, name
		case coinDescription = "description"
		case links, image
		case marketCapRank = "market_cap_rank"
	}
}
