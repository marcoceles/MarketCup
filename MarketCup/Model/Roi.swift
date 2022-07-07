//
//  MarketsResponse.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

struct Roi: Decodable{
	let times: Double
	let currency: String
	let percentage: Double
}
