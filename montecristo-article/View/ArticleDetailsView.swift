//
//  ArticleDetailsView.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import SwiftUI

struct ArticleDetailsView: View {
    @State var articleDetailsModel = ArticleDetailsModel()
    var articleDetails: Article
    let options = ["Edit", "Delete"]

    var body: some View {
        VStack {
            HStack {
                Text(articleDetails.title)
                    .bold()
                    .font(.largeTitle)
                    .padding(.bottom)

                Spacer()

                Menu{
                    Button("Edit", action: {

                    })

                    Button("Delete", action: {

                    })
                } label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundStyle(.blue)
                        .padding(10)
                        .contentShape(.rect)
                }
            }

            Text(articleDetails.subtitle)
                .foregroundStyle(.secondary)
                .font(.subheadline)
                .hAlign(.leading)
            Divider()
            Text(articleDetails.content)
                .padding(.top)
                .hAlign(.leading)
        }
    
        .padding()
        .vAlign(.top)
    }
}

#Preview {
    ArticleDetailsView(articleDetails: Article(title: "Bora bill", subtitle: "Bora bill", content: "Bora bill"))
}
