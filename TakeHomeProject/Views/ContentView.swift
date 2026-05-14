//
//  ContentView.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 12/5/26.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ContentViewVM = ContentViewVM()

    var body: some View {
        NavigationStack {
            List(viewModel.articles, rowContent: ArticleRow.init)
            .navigationDestination(for: Article.self, destination: ArticleView.init)
            .navigationTitle("Take Home Project")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await viewModel.loadArticles()
        }
    }
}

#Preview {
    ContentView()
}
