//
//  ArticleListView.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import SwiftUI
import SwiftUINavigation

struct ArticleListView: View {
    @State var articleListModel = ArticleListModel()

    private var editButton: some View {
        Group {
            if articleListModel.editingMode == .inactive {
                Button(action: articleListModel.editButtonPressed) {
                    Text("Edit")
                }
            } else {
                Button(action: articleListModel.doneButtonPressed) {
                    Text("Done")
                }
            }
        }
    }

    private var deleteButton: some View {
        Group {
            if articleListModel.editingMode == .inactive {
                EmptyView()
            } else {
                Button(action: articleListModel.deleteButtonPressed) {
                    Image(systemName: "trash")
                }
            }
        }
    }

    private var createButton: some View {
        Group {
            if articleListModel.editingMode == .active {
                EmptyView()
            } else {
                Button(action: articleListModel.createButtonPressed) {
                    Image(systemName: "plus")
                }
            }
        }
    }

    var body: some View {
        VStack {
            Text("Monte Cristo Articles")
                .font(.title)
                .bold()
                .hAlign(.leading)
            List($articleListModel.articles, selection: $articleListModel.selectedItems) { articles in
                NavigationLink {
                    ArticleDetailsView(articleDetails: articles)
                } label: {
                    Text(articles.title.wrappedValue)
                }
            }
            .environment(\.editMode, $articleListModel.editingMode)
            .listStyle(.inset)
            .scrollContentBackground(.hidden)
            .sheet(isPresented: $articleListModel.shouldPresentCreateSheet,
                   content: {
                CreateArticleSheetView(shouldPresentCreateSheet: $articleListModel.shouldPresentCreateSheet,
                                       articles: $articleListModel.articles
                )
            })
        }
        .padding()
        .vAlign(.top)
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
    }
}

#Preview {
    ArticleListView()
}
