//
//  ArticleListModel.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import Foundation
import SwiftUI
import SwiftNavigation
import SwiftUINavigation
import IdentifiedCollections

@Observable
class ArticleListModel {
    var articles: IdentifiedArrayOf<ArticleDetailsModel>
    var selectedItems: Set<ArticleDetailsModel.ID> = []
    var editingMode = EditMode.inactive
    var shouldPresentCreateSheet = false

    var destination: Destination?

    @CasePathable
    enum Destination {
        case add(ArticleDetailsModel)
        case edit(ArticleDetailsModel)
    }

    init(
        articles: IdentifiedArrayOf<ArticleDetailsModel> = []
    ) {
        self.articles = articles
    }

    //    private func bind() {
    //        for articleDetailsModel in articles {
    //            articleDetailsModel.onTap = { [weak self, weak articleDetailsModel] in
    //                guard let self, let articleDetailsModel else { return }
    //                destination = .edit(articleDetailsModel)
    //            }
    //        }
    //    }

    func deleteButtonPressed() {
        withAnimation {
            for article in selectedItems {
                if let index = articles.firstIndex(where: { $0.id == article }) {
                    articles.remove(at: index)
                }
            }
            selectedItems = Set<ArticleDetailsModel.ID>()
            editingMode = .inactive
        }
    }

    func closeArticleCreator() {
        destination = nil
    }

    func saveCreatedArticle(article: Binding<Article>) {
        articles.append(ArticleDetailsModel(article: article.wrappedValue, isArticleCreationMode: false))
        destination = nil
    }

    func createButtonPressed() {
        destination = .add(ArticleDetailsModel(
            article: Article(title: "", subtitle: "", content: ""), isArticleCreationMode: true)
        )
    }

    func editButtonPressed() {
        editingMode = .active
    }

    func doneButtonPressed() {
        editingMode = .inactive
    }
}
