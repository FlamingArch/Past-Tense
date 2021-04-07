//
//  JournalModel.swift
//  Past Tense
//
//  Created by Harsh Chaturvedi on 06/12/20.
//

import Foundation

class JournalModel : ObservableObject {
    @Published var pages : [PageModel]
    init(pages : [PageModel]) {
        self.pages = pages
    }
}
