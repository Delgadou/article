//
//  Mock.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import Foundation

struct Article: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var content: String

    static let mockData: [Article] = [
        Article(title: "How to create App Intents", subtitle: "Discover more about app intents in this article", content: "Lorem ipsum"),
        Article(title: "How to create add Controls", subtitle: "Discover more about add Controlsin this article", content: "Lorem ipsum"),
        Article(title: "How to create Login App", subtitle: "Discover more about Login App in this article", content: "Lorem ipsum"),
        Article(title: "Internacional from Porto Alegre", subtitle: "Discover more about Internacional history", content: "Lorem ipsum"),
    ]

    static let mockFulldata: [Article] = [
        Article(title: "Gorillaz discography", subtitle: "Discover more about gorillaz discography order", content: "Lorem ipsum"),
        Article(title: "The Strokes discography", subtitle: "Discover more about The Strokes in this article", content: "Lorem ipsum"),
        Article(title: "The history of grunge", subtitle: "Learn more about grunge in this article", content: "Lorem ipsum"),
    ]
}