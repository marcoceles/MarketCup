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
			List(vm.markets) { market in
				Text(market.name ?? "Test")
			}
		}
		.onAppear(){
			self.vm.loadMarkets()
		}
    }
}
