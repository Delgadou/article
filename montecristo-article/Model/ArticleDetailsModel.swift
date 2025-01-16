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

@Observable
class ArticleDetailsModel: Identifiable {
    var editingMode = EditMode.inactive
    var article: Article
    var isArticleCreationMode: Bool = false

    var onTap: () -> Void = unimplemented("ItemRowModel.onTap")

    func editButtonPressed() {
        editingMode = .active
    }

    func doneButtonPressed() {
        editingMode = .inactive
    }

    func articleButtonPressed() {

    }

    init(article: Article, isArticleCreationMode: Bool) {
        self.article = article
        if (isArticleCreationMode) {
            self.isArticleCreationMode = isArticleCreationMode
            self.editingMode = .active
        }
    }
}
