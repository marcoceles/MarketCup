//
//  CoinListView.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import SwiftUI

struct CoinListView: View {

	@ObservedObject var vm: CoinListViewModel

	@State private var isLoading = true
	@State private var showingError = false
	@State private var markets: [Market] = [Market]()

    var body: some View {
		NavigationView {
			ZStack {
				contentView()
			}
			.navigationTitle("MarketCup")
		}
		.onAppear(){
			self.vm.loadMarkets()
		}
    }

	func contentView() -> AnyView {
		switch vm.state {
		case .success(let markets):
			return AnyView(
				List(markets) { market in
					Section {
						CoinRowView(market: market)
							.listRowSeparator(.hidden)
							.listRowBackground(
								Color.indigo
									.clipped()
									.cornerRadius(16)
							)
							.listRowInsets(EdgeInsets(top: 16,
													  leading: 0,
													  bottom: 16,
													  trailing: 0))
							.background(
								NavigationLink(destination: Text("test")){}
									.buttonStyle(PlainButtonStyle())
							)
					}
				}
				.listStyle(.insetGrouped)

			)
		default:
			return AnyView(
				ProgressView()
					.progressViewStyle(.circular)
			)
		}
	}
}
