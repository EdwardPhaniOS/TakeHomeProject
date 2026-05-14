//
//  URLSessionMocking.swift
//  TakeHomeProjectTests
//
//  Created by Vinh Phan on 14/5/26.
//

import Foundation
@testable import TakeHomeProject

struct URLSessionMocking: DataFetching {
    var data: Data

    func data(from url: URL) async throws -> (Data, URLResponse) {
        return (data, URLResponse())
    }
}
