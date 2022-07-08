//
//  MarketsOrder.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import Foundation

enum MarketsOrder: String, Encodable {
	case marketCapDesc = "market_cap_desc"
	case geckoDesc = "gecko_desc"
	case geckoAsc = "gecko_asc"
	case marketCapAsc = "market_cap_asc"
	case volumeAsc = "volume_asc"
	case volumeDesc = "volume_desc"
}
