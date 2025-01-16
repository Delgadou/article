//
//  ArticleDetailsView.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import SwiftUI

struct ArticleDetailsView: View {
    @Binding var model: ArticleDetailsModel

    private var editButton: some View {
        Group {
            if (model.isArticleCreationMode) {
                EmptyView()
            } else {
                if model.editingMode == .inactive {
                    Button(action: model.editButtonPressed) {
                        Text("Edit")
                    }
                } else {
                    Button(action: model.doneButtonPressed) {
                        Text("Done")
                    }
                }
            }
        }
    }

    var body: some View {
        VStack {
            if model.editingMode == .active {
                TextField("Title", text: $model.article.title, axis: .vertical)
                    .lineLimit(1...5)
                    .textCustomStyle()
            } else {
                Text(model.article.title)
                    .textCustomStyle()
            }

            if model.editingMode == .active {
                TextField("Subtitle", text: $model.article.subtitle, axis: .vertical)
                    .lineLimit(1...3)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .hAlign(.leading)
            } else {
                Text(model.article.subtitle)
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
                    .hAlign(.leading)
            }

            if(model.editingMode == .active) {
                TextEditor(text: $model.article.content)
                    .padding(.all, 10)
                    .padding(.bottom, 10)
                    .lineLimit(5...10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .disabled(model.editingMode == .active ? false: true)
            } else {
                Divider()
                Text(model.article.content)
                    .padding(.bottom, 10)
                    .frame(maxWidth: .infinity, alignment: .leading )
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                editButton
            }
        }
        .padding()
        .vAlign(.top)
    }
}

extension View {
    @ViewBuilder
    func textCustomStyle() -> some View {
        self
            .bold()
            .font(.largeTitle)
            .padding(.bottom)
            .hAlign(.leading)
    }
}

#Preview {
    //ArticleDetailsView(articleDetails: Article(title: "Bora bill", subtitle: "Bora bill", content: "Bora bill"))
}
