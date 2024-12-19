//
//  CreateArticleSheetView.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 19/12/24.
//
import SwiftUI

struct CreateArticleSheetView: View {
    @State var createArticleModel = CreateArticleSheetModel()

    @Binding var shouldPresentCreateSheet: Bool
    @Binding var articles: [Article]

    var body: some View {
        VStack {
            Text("Create new article")
                .font(.title)

            Text("Title")
                .foregroundStyle(.secondary)
                .hAlign(.leading)
            TextField("", text: $createArticleModel.title)
                .autocapitalization(.none)
                .padding(.all, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )

            Text("Subititle")
                .foregroundStyle(.secondary)
                .hAlign(.leading)
            TextField("", text: $createArticleModel.subtitle)
                .autocapitalization(.none)
                .padding(.all, 10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )

            Text("Content")
                .foregroundStyle(.secondary)
                .hAlign(.leading)
            TextEditor(text: $createArticleModel.content)
                .padding(.all, 10)
                .padding(.bottom, 10)
                .lineLimit(5...10)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Button {
                createArticleModel.createButtonPressed(shouldPresentCreateSheet: $shouldPresentCreateSheet, articles: $articles)
            } label: {
                Text("Create")
            }.padding()
        }
        .padding()
        .vAlign(.top)
    }
}
