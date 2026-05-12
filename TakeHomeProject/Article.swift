//
//  Article.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 12/5/26.
//

import Foundation

struct Article: Decodable, Identifiable, Hashable {
    let id: String
    let title: String
    let description: String
    let text: String
}
