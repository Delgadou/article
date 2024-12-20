//
//  Mock.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import Foundation

struct Article: Identifiable, Hashable, Equatable, Sendable {
    var id = UUID()
    var title: String
    var subtitle: String
    var content: String

    static func preview() -> [Article] {
        [Article(title: "How to create App Intents", subtitle: "Discover more about app intents in this article", content: "Lorem ipsum"),
         Article(title: "How to create add Controls", subtitle: "Discover more about add Controlsin this article", content: "Lorem ipsum"),
         Article(title: "How to create Login App", subtitle: "Discover more about Login App in this article", content: "Lorem ipsum"),
         Article(title: "Internacional from Porto Alegre", subtitle: "Discover more about Internacional history", content: "Lorem ipsum"),
        ]
    }

    static let mockData: [Article] = [
        Article(title: "How to create App Intents", subtitle: "Discover more about app intents in this article", content: "Lorem ipsum"),
        Article(title: "How to create add Controls", subtitle: "Discover more about add Controlsin this article", content: "Lorem ipsum"),
        Article(title: "How to create Login App", subtitle: "Discover more about Login App in this article", content: "Lorem ipsum"),
        Article(title: "Internacional from Porto Alegre", subtitle: "Discover more about Internacional history", content: "Lorem ipsum"),
    ]
}
