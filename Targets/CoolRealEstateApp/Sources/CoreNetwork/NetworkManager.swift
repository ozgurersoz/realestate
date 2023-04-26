//
//  NetworkManager.swift
//  CoolRealEstateApp
//
//  Created by Ozgur Ersoz on 2023-04-25.
//  Copyright © 2023 CoolRealEstate AB. All rights reserved.
//

import Foundation

class NetworkManager {
    private let session = URLSession.shared
    private let baseURL = "https://pastebin.com/"

    enum NetworkError: Error {
        case badURL
    }

    private func createRequest(
        path: String, method: HTTPMethod,
        body: Encodable? = nil
    ) throws -> URLRequest {
        guard let url = URL(string: "\(baseURL)\(path)") else {
            throw NetworkError.badURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        return request
    }

    private func decodeResponse<T: Decodable>(
        from data: Data,
        responseType: T.Type
    ) throws -> T {
        let decoder = JSONDecoder()
        return try decoder.decode(responseType, from: data)
    }

    func performRequest<ResponseType: Decodable>(
        path: String, method: HTTPMethod,
        responseType: ResponseType.Type,
        requestBody: Encodable? = nil
    ) async throws -> ResponseType {
        let request: URLRequest
        request = try createRequest(path: path, method: method, body: requestBody)
        let (data, _) = try await session.data(for: request)
        let decodedResponse = try decodeResponse(from: data, responseType: responseType)
        return decodedResponse
    }
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
