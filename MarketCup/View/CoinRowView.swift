//
//  CoinRowView.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import SwiftUI

struct CoinRowView: View {

	let market: Market

	var body: some View {
		HStack {
			ZStack {
				AsyncImage(
					url: URL(string: market.image ?? ""),
					content: { image in
						image.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(maxWidth: 36, maxHeight: 36)
					},
					placeholder: {
						ProgressView()
					}
				)
			}
			.frame(minWidth: 44, minHeight: 44)
			.padding(4)
			.background(.thinMaterial)
			.clipShape(RoundedRectangle(cornerRadius: 12))

			VStack (alignment: .leading){
				Text(market.name ?? "")
					.font(.headline)
					.foregroundStyle(.primary)
				Text(market.symbol?.uppercased() ?? "")
					.font(.caption)
					.foregroundStyle(.primary)
				Spacer()
			}

			Spacer()

			VStack (alignment: .trailing){
				Text(market.currentPrice ?? 0.0, format: .currency(code: "EUR"))
					.font(.headline)
					.foregroundStyle(.primary)
				Spacer()
			}
		}
		.padding(8)

	}
}

struct ItemRow_Previews: PreviewProvider {
	static var previews: some View {
		CoinRowView(market: Market.preview)
	}
}
