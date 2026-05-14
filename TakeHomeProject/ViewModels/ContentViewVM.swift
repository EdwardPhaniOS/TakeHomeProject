//
//  ContentViewVM.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 14/5/26.
//

import Foundation

@Observable @MainActor
class ContentViewVM {
    enum LoadState {
        case loading, loaded, failed
    }

    private(set) var articles: [Article] = []
    private(set) var loadState: LoadState = .loading
    private(set) var loadError: Error?
    var filterText: String = ""
    var urlSession: DataFetching

    init(urlSession: DataFetching = URLSession(configuration: .default)) {
        self.urlSession = urlSession
    }

    var filteredArticles: [Article] {
        if filterText.isEmpty {
            return articles
        } else {
            return articles.filter {
                $0.title.localizedStandardContains(filterText)
            }
        }
    }

    func loadArticles() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/news")!
        loadState = .loading

        do {
            let (data, _) = try await urlSession.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let articles = try decoder.decode([Article].self, from: data)
            self.articles = articles
            loadState = .loaded
        } catch {
            loadState = .failed
            loadError = error
        }
    }
}
