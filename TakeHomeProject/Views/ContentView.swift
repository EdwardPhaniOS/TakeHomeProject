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
            Group {
                switch viewModel.loadState {
                case .failed:
                    LoadFailedView(error: viewModel.loadError) {
                        Task {
                            await viewModel.loadArticles()
                        }
                    }

                default:
                    if viewModel.articles.isEmpty {
                        ProgressView("Loading...")
                            .controlSize(.extraLarge)
                    } else {
                        List(viewModel.filteredArticles, rowContent: ArticleRow.init)
                            .navigationDestination(for: Article.self, destination: ArticleView.init)
                            .refreshable(action: viewModel.loadArticles)
                            .searchable(text: $viewModel.filterText, prompt: "Filter articles")
                    }
                }
            }
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
