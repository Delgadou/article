//
//  ArticleListView.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import SwiftUI
import SwiftUINavigation

struct ArticleListView: View {
    @State var model = ArticleListModel()

    private var editButton: some View {
        Group {
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

    private var deleteButton: some View {
        Group {
            if model.editingMode == .inactive {
                EmptyView()
            } else {
                Button(action: model.deleteButtonPressed) {
                    Image(systemName: "trash")
                }
            }
        }
    }

    private var createButton: some View {
        Group {
            if model.editingMode == .active {
                EmptyView()
            } else {
                Button(action: model.createButtonPressed) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    var body: some View {
        List(model.articles, selection: $model.selectedItems) { articles in
            Button() {
                model.destination = .edit(articles)
            } label: {
                HStack {
                    Text(articles.article.title)
                    Spacer()
                    Image(systemName: "chevron.right")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.trailing)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                deleteButton
            }
            ToolbarItem(placement: .topBarLeading) {
                createButton
            }
            ToolbarItem(placement: .topBarTrailing) {
                editButton
            }
        }
        .environment(\.editMode, $model.editingMode)
        .listStyle(.inset)
        .scrollContentBackground(.hidden)
        .navigationTitle("Monte Cristo Articles")
        .navigationDestination(item: $model.destination.edit) { item in
            ArticleDetailsView(model: item)
        }
        .vAlign(.top)
        .sheet(item: $model.destination.add) { $itemToAdd in
            NavigationStack {
                ArticleDetailsView(model: $itemToAdd)
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button("Cancel") {
                                model.closeArticleCreator()
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button("Create") {
                                model.saveCreatedArticle(article: $itemToAdd.article)
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    ArticleListView()
}
