//
//  ArticleDetailsView.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import SwiftUI

struct ArticleDetailsView: View {
    @State var articleDetailsModel = ArticleDetailsModel()
    @Binding var articleDetails: Article

    private var editButton: some View {
        Group {
            if articleDetailsModel.editingMode == .inactive {
                Button(action: articleDetailsModel.editButtonPressed) {
                    Text("Edit")
                }
            } else {
                Button(action: articleDetailsModel.doneButtonPressed) {
                    Text("Done")
                }
            }
        }
    }

    var body: some View {
        VStack {
            Text(articleDetails.title)
                .bold()
                .font(.largeTitle)
                .padding(.bottom)
                .hAlign(.leading)

            Text(articleDetails.subtitle)
                .foregroundStyle(.secondary)
                .font(.subheadline)
                .hAlign(.leading)

            TextEditor(text: $articleDetails.content)
                .padding(.all, 10)
                .padding(.bottom, 10)
                .lineLimit(5...10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .disabled(articleDetailsModel.editingMode == .active ? false : true)
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

#Preview {
    //ArticleDetailsView(articleDetails: Article(title: "Bora bill", subtitle: "Bora bill", content: "Bora bill"))
}
