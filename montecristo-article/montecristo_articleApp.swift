//
//  montecristo_articleApp.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import SwiftUI

@main
struct montecristo_articleApp: App {
    let model = ArticleListModel(
        articles: [
        ArticleDetailsModel(
            article: Article(title: "How to create App Intents", subtitle: "Discover more about app intents in this article", content: "Lorem ipsum"),
            isArticleCreationMode: false
        ),
        ArticleDetailsModel(
            article: Article(title: "How to create App Intents", subtitle: "Discover more about app intents in this article", content: "Lorem ipsum"),
            isArticleCreationMode: false
        ),
        ArticleDetailsModel(
            article: Article(title: "How to create App Intents", subtitle: "Discover more about app intents in this article", content: "Lorem ipsum"),
            isArticleCreationMode: false
        ),
        ArticleDetailsModel(
            article: Article(title: "Internacional from Porto Alegre", subtitle: "Discover more about Internacional history", content: "Lorem ipsum"),
            isArticleCreationMode: false
        ),
    ])

    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ArticleListView(model: self.model)
            }
        }
    }
}
