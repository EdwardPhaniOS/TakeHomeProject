//
//  Article.swift
//  TakeHomeProject
//
//  Created by Vinh Phan on 12/5/26.
//

import Foundation

struct Article: Decodable, Identifiable, Hashable {
    let id: String
    let section: String
    let title: String
    let description: String
    let text: String

    let date: Date
    let thumbnail: URL
    let image: URL
}

extension Article {
    static let example: Article = Article(id: UUID().uuidString,
                                          section: "Australia news",
                                          title: "What the budget means for your generation – gen Z, millennial, gen X or boomer ",
                                          description: "Jim Chalmers has sold the budget as a historic shift in favour of intergenerational fairness. Four Guardian Australia staff members assess what it means for their age group",
                                          text: "Gen Z: not off the treadmill yet It’s hard to speak for the millions in the gen Z collective. We were born in the mid-to-late 90s to 2010, making up at least 18.2% of the Australian population, and are at many wildly different stages of life. Some zoomers have started families; others live in share houses or childhood bedrooms. Despite our varying circumstances, we are largely united by a sense of uncertainty.",
                                          date: .now,
                                          thumbnail: URL(string: "https://media.guim.co.uk/92b44f4df8b29a8c22923d682f60991a5adcae22/0_0_4000_3200/500.jpg")!,
                                          image: URL(string: "https://media.guim.co.uk/92b44f4df8b29a8c22923d682f60991a5adcae22/0_0_4000_3200/1000.jpg")!)

}
