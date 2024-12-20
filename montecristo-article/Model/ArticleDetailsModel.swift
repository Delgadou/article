//
//  ArticleDetailsModel.swift
//  montecristo-article
//
//  Created by Henrique Delgado on 17/12/24.
//

import Foundation
import SwiftUI

@Observable
class ArticleDetailsModel {
    var editingMode = EditMode.inactive

    func editButtonPressed() {
        editingMode = .active
    }


    func doneButtonPressed() {
        editingMode = .inactive
    }

    func articleButtonPressed() {

    }

}
