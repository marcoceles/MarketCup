//
//  MarketsRequest.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

struct MarketsRequest: Encodable {
	let vs_currency: String
	let ids: String?
	let category: String?
	let order: MarketsOrder?
	let per_page: Int?
	let page: Int?
}

enum MarketsOrder: String, Encodable {
	case marketCapDesc = "market_cap_desc"
	case geckoDesc = "gecko_desc"
	case geckoAsc = "gecko_asc"
	case marketCapAsc = "market_cap_asc"
	case volumeAsc = "volume_asc"
	case volumeDesc = "volume_desc"
}
