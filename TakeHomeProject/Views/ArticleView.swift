//
//  ArticleView.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 12/5/26.
//

import SwiftUI

struct ArticleView: View {
    var article: Article

    var body: some View {
        ScrollView {
            ArticleImageView(imageURL: article.image)

            VStack(alignment: .leading, spacing: 20) {
                Text(article.title)
                    .font(.title)

                Text(article.description)
                    .font(.headline)
                    .foregroundStyle(.secondary)

                Divider()

                Text(article.text)
            }
            .padding(.horizontal)
        }
        .navigationTitle(article.section)
    }
}

#Preview {
    ArticleView(article: .example)
}
