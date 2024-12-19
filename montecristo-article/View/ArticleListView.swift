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

            List(selection: $articleListModel.selectedItems) {
                ForEach(articleListModel.articles) { article in
                    NavigationLink(article.title, value: article)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                }
            }
            .environment(\.editMode, $articleListModel.editingMode)
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
        .navigationDestination(for: Article.self) { article in
            ArticleDetailsView(articleDetails: article)
        }
    }
}

#Preview {
    ArticleListView()
}
