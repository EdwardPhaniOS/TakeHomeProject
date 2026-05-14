//
//  TakeHomeProjectTests.swift
//  TakeHomeProjectTests
//
//  Created by Vinh Phan on 14/5/26.
//

import Testing
@testable import TakeHomeProject
import Foundation

@MainActor
struct ContentViewVMTests {

    @Test func startWithEmptyArticles() async throws {
        let sut = createSUT()
        #expect(sut.articles.isEmpty, "Articles should be empty initally")
        #expect(sut.loadState == .loading, "Load state should be loading")
    }

    @Test func articlesNotEmptyAfterLoad() async throws {
        let sut = createSUT()
        await sut.loadArticles()
        #expect(sut.articles.isEmpty == false, "Articles should not empty after loading")
        #expect(sut.loadState == .loaded, "Load state should be loaded")
    }

    @Test func filterFullArticles() async throws {
        let sut = createSUT()
        await sut.loadArticles()
        #expect(sut.articles == sut.filteredArticles, "All articles should be shown")
    }

    @Test func filterExactArticle() async throws {
        let sut = createSUT()
        await sut.loadArticles()
        sut.filterText = sut.articles.first?.title ?? ""
        #expect(sut.filteredArticles.count == 1, "Should filter exact 1 article")
    }

    @Test func filterEmptyArticle() async throws {
        let sut = createSUT()
        await sut.loadArticles()
        sut.filterText = "XXX NO ARTICLE XXX"
        #expect(sut.filteredArticles.isEmpty, "With impossible filter text, no articles should be shown")
    }

    func createSUT() -> ContentViewVM {
        let mockURLSession = createMockURLSession()
        let sut = ContentViewVM(urlSession: mockURLSession)
        return sut
    }

    func createMockURLSession() -> URLSessionMocking {
        let articles: [Article] = [Article.example]
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        
        let data = try! encoder.encode(articles)
        let mock = URLSessionMocking(data: data)
        return mock
    }
}
