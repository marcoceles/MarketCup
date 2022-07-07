//
//  NetworkService.swift
//  MarketCup
//
//  Created by Marco Celestino on 07/07/22.
//

import Foundation

protocol NetworkService {
	func sendRequest<T: Decodable, B: Encodable>(endpoint: Endpoint, body: B?, responseModel: T.Type) async -> Result<T, APIError>
}

extension NetworkService {
	func sendRequest<T: Decodable, B: Encodable>(endpoint: Endpoint, body: B?, responseModel: T.Type) async -> Result<T, APIError> {
		guard let url = URL(string: endpoint.baseURL + endpoint.path) else {
			return .failure(.invalidURL)
		}

		var request = URLRequest(url: url)
		request.httpMethod = endpoint.method.rawValue

		if let body = body {
			request.httpBody = try? JSONEncoder().encode(body)
		}

		do {
			let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
			guard let response = response as? HTTPURLResponse else {
				return .failure(.noResponse)
			}
			switch response.statusCode {
			case 200...299:
				guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
					return .failure(.decode)
				}
				return .success(decodedResponse)
			case 401:
				return .failure(.unauthorized)
			default:
				return .failure(.unexpectedStatusCode)
			}
		} catch {
			return .failure(.unknown)
		}
	}
}
