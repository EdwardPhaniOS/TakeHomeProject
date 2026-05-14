//
//  ContentViewVM.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 14/5/26.
//

import Foundation

@Observable
class ContentViewVM {
    private(set) var articles: [Article] = []

    func loadArticles() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/news")!
        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let articles = try decoder.decode([Article].self, from: data)
            await MainActor.run {
                self.articles = articles
            }
        } catch {
            print("DEBUG - error: \(error.localizedDescription)")
        }
    }
}
