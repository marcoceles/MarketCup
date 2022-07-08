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

	init(vm: CoinListViewModel) {
		UITableView.appearance().backgroundColor = .clear
		UITableViewCell.appearance().backgroundColor = .clear

		self.vm = vm
	}

    var body: some View {
		NavigationView {
			ZStack {
				RadialGradient(stops: [
					.init(color: .indigo, location: 0.3),
					.init(color: .black, location: 0.3),
				], center: .top, startRadius: 200, endRadius: 700)
				.ignoresSafeArea()
				contentView()
			}
			.navigationTitle("MarketCup")
		}
		.accentColor(.primary)
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
								Color(red: 0.7, green: 0.7, blue: 0.7).opacity(0.8)
									.clipped()
									.cornerRadius(16)
							)
							.listRowInsets(EdgeInsets(top: 16,
													  leading: 0,
													  bottom: 16,
													  trailing: 0))
							.background(
								NavigationLink(destination: CoinDetailView(vm: CoinDetailViewModel(id: market.id))){}
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
