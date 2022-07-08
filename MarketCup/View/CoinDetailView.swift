//
//  CoinDetailView.swift
//  MarketCup
//
//  Created by Marco Celestino on 08/07/22.
//

import SwiftUI

struct CoinDetailView: View {

	@ObservedObject var vm: CoinDetailViewModel
	
    var body: some View {
		ZStack {
			RadialGradient(stops: [
				.init(color: .indigo, location: 0.3),
				.init(color: .black, location: 0.3),
			], center: .top, startRadius: 200, endRadius: 700)
			.ignoresSafeArea()

			ScrollView {
				contentView()
			}
		}
		.onAppear(){
			vm.loadDetail()
		}
		.navigationBarTitleDisplayMode(.inline)
    }

	func contentView() -> AnyView {
		switch vm.state {
		case .success(let detail):
			return AnyView(
				VStack(alignment: .leading, spacing: 16) {
					HStack {
						AsyncImage(
							url: URL(string: detail.image.large),
							content: { image in
								image.resizable()
									.aspectRatio(contentMode: .fit)
									.frame(maxWidth: 48, maxHeight: 48)
							},
							placeholder: {
								ProgressView()
							}
						)
						VStack (alignment: .leading) {
							Text(detail.name)
								.font(.largeTitle)
							Text("Last 7 days chart")
								.font(.body)
						}
						Spacer()

						if let homePageString = detail.links.homepage.first,
							let websiteUrl = URL(string: homePageString){
							Link(destination: websiteUrl) {
								Text("Website")
									.font(.subheadline)
									.foregroundColor(.white)
									.padding(5)
									.background(.black)
									.clipShape(Capsule())
							}
						}
	 				}

					CoinChartView(vm: CoinChartViewModel(id: detail.id))

					Text(detail.coinDescription.en)
						.font(.body)
						.foregroundColor(.white)
					Spacer()
				}
				.padding()
			)
		default:
			return AnyView(
				ProgressView()
					.progressViewStyle(.circular)
			)
		}
	}
}

struct CoinDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailView(vm: CoinDetailViewModel(id: "bitcoin"))
    }
}
