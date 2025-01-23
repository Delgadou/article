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

@MainActor
@Observable
class ArticleListModel {
    var articles: IdentifiedArrayOf<ArticleDetailsModel> {
        didSet {
            bind()
        }
    }
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
        bind()
    }

    private func bind() {
        for articleDetailsModel in articles {
            articleDetailsModel.onSave = { [weak self, weak articleDetailsModel] in
                guard let self, let articleDetailsModel else { return }
                if let index = articles.firstIndex(where: { $0.id == articleDetailsModel.id }) {
                    articles[index].article = articleDetailsModel.editableArticle
                }
                    articleDetailsModel.editingMode = .inactive
            }
        }
    }

    func articleDetailsPressed(article: ArticleDetailsModel) {
        destination = .edit(article)
    }

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

    func saveCreatedArticle(article: Article) {
        articles.append(ArticleDetailsModel(article: article, isArticleCreationMode: false))
        destination = nil
    }

    func createButtonPressed() {
        destination = .add(ArticleDetailsModel(article: Article(title: "", subtitle: "", content: ""), isArticleCreationMode: true))
    }

    func editButtonPressed() {
        editingMode = .active
    }

    func doneButtonPressed() {
        editingMode = .inactive
    }
}
