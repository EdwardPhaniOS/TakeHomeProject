//
//  ArticleRow.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 14/5/26.
//

import SwiftUI

struct ArticleRow: View {
    var article: Article

    var body: some View {
        NavigationLink(value: article) {
            HStack {
                ArticleImageView(imageURL: article.thumbnail)
                .frame(width: 80, height: 80)
                .clipShape(.rect(cornerRadius: 10))

                VStack(alignment: .leading) {
                    Text(article.section)
                        .font(.caption.weight(.bold))
                    Text(article.title)
                }
            }
        }
    }
}

#Preview {
    ArticleRow(article: .example)
}
