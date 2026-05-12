//
//  ContentView.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 12/5/26.
//

import SwiftUI

struct ContentView: View {
    @State var articles: [Article] = []

    var body: some View {
        NavigationStack {
            List(articles) { article in
                NavigationLink(article.title, value: article)
            }
            .navigationDestination(for: Article.self) { article in
                Text(article.text)
            }
        }
        .task {
            await loadArticles()
        }
    }

    func loadArticles() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/news")!
        let request = URLRequest(url: url)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            let articles = try decoder.decode([Article].self, from: data)
            await MainActor.run {
                self.articles = articles
            }
        } catch {
            print("DEBUG - error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentView()
}
