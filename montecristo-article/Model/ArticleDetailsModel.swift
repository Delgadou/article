//
//  ArticleDetailsModel.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import Foundation
import SwiftUI
import SwiftUINavigation
import XCTestDynamicOverlay

@MainActor
@Observable
class ArticleDetailsModel: Identifiable {
    var editingMode = EditMode.inactive
    var article: Article
    var editableArticle: Article = Article(title: "", subtitle: "", content: "")
    var isArticleCreationMode: Bool = false
    var onSave: (Article) -> Void = unimplemented("ItemRowModel.onSave")

    func buttonSavedPressed() {
        onSave(editableArticle)
    }

    func editArticle() {
        editableArticle = article
        editingMode = .active
    }

    func saveEditedArticle() {
        editingMode = .inactive
    }

    func cancelEditing() {
        editingMode = .inactive
    }

    init(article: Article, isArticleCreationMode: Bool) {
        self.article = article
        if (isArticleCreationMode) {
            self.isArticleCreationMode = isArticleCreationMode
            self.editingMode = .active
        }
    }
}
