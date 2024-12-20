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
                ForEach($articleListModel.articles, id: \.id) { articleBinding in
                    NavigationLink(value: articleBinding) {
                        VStack(alignment: .leading) {
                            Text(articleBinding.wrappedValue.title)
                        }
                    }
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
        .navigationDestination(for: Binding<Article>.self) { articleBinding in
            ArticleDetailsView(articleDetails: articleBinding)
        }
    }
}

extension Binding: @retroactive Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.hashValue)
    }
}

extension Binding: @retroactive Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}

#Preview {
    ArticleListView()
}
