//
//  CoinChartView.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import SwiftUI
import LineChartView

struct CoinChartView: View {

	@ObservedObject var vm: CoinChartViewModel
	
	var body: some View {
		ZStack {
			Color.white.opacity(0.8)
				.clipShape(RoundedRectangle(cornerRadius: 16))
			VStack {
				contentView()
			}
			.clipped()
		}
		.frame(maxWidth: .infinity, minHeight: 200)
		.onAppear(){
			vm.loadData()
		}
	}

	func contentView() -> AnyView {
		switch vm.state {
		case .success(let data):
			return AnyView(
				LineChartView(lineChartParameters: LineChartParameters(
					data: vm.normalizeChartData(marketChart: data),
					labelColor: .black,
					secondaryLabelColor: .gray,
					labelsAlignment: .left,
					dataPrecisionLength: 2,
					dataPrefix: nil,
					dataSuffix: " EUR",
					indicatorPointColor: .indigo,
					indicatorPointSize: 12,
					lineColor: .indigo,
					lineSecondColor: .purple,
					lineWidth: 3,
					dotsWidth: 1,
					displayMode: .default,
					dragGesture: true,
					hapticFeedback: true
				))
				.frame(maxWidth: .infinity, minHeight: 200)
			)
		case .apiError:
			return AnyView(
				Text("Could not load chart")
			)
		default:
			return AnyView(
				ProgressView()
					.progressViewStyle(.circular)
			)
		}
	}
}

struct CoinChartView_Previews: PreviewProvider {
    static var previews: some View {
		CoinChartView(vm: CoinChartViewModel(id: "bitcoin"))
    }
}
