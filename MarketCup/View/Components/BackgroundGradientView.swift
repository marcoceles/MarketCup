//
//  BackgroundGradientView.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import SwiftUI

struct BackgroundGradientView: View {

	var body: some View {
		RadialGradient(stops: [
			.init(color: .indigo, location: 0.3),
			.init(color: .black, location: 0.3),
		], center: .top, startRadius: 200, endRadius: 700)
		.ignoresSafeArea()
	}
}
