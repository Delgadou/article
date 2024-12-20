//
//  CreateArticleSheetModel.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 19/12/24.
//

import Foundation
import SwiftUI

@Observable
class CreateArticleSheetModel {
    var title: String = ""
    var subtitle: String = ""
    var content: String = ""

    func createButtonPressed(shouldPresentCreateSheet: Binding<Bool>, articles: Binding<[Article]>) {
        articles.wrappedValue.append(Article(title: title, subtitle: subtitle, content: content))
        shouldPresentCreateSheet.wrappedValue = false
    }
}
