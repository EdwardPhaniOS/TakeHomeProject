//
//  ArticleImage.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 14/5/26.
//

import SwiftUI

struct ArticleImageView: View {
    var imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image.resizable()
                    .scaledToFill()
            default:
                Image(systemName: "newspaper")
            }
        }
    }
}

#Preview {
    ArticleImageView(imageURL: Article.example.image)
}
