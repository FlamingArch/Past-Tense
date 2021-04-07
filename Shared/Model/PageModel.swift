//
//  PageModel.swift
//  Past Tense (iOS)
//
//  Created by Harsh Chaturvedi on 05/12/20.
//

import SwiftUI

class PageModel : ObservableObject, Identifiable {
    let id = UUID()
    @Published var headline : String
    @Published var body : String
    @Published var image : Image
    @Published var date : Date = Date()
    //    var date : Date
    
    init(headline: String, body: String, image: Image, date: Date = Date() ){
        self.headline = headline
        self.body = body
        self.image = image
    }
    
}
