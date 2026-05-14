//
//  DataFetching.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 14/5/26.
//

import Foundation

protocol DataFetching {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: DataFetching {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return try await self.data(for: URLRequest(url: url))
    }
}
