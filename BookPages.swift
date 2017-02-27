//
//  BookPages.swift
//  Kindle Clone
//
//  Created by Cynthia Whitlatch on 2/23/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
    let pages: [Page]
    let coverImageUrl: String

//    let image: UIImage
//
//    init(title: String, author: String, pages: [Page], image: UIImage) {
//        self.title = title
//        self.author = author
//        self.pages = pages
//        self.image = image
//        self.coverImageUrl = ""
//    }
    
    init(dictionary: [String:Any]) {
        self.title = (dictionary["title"] as? String) ?? ""
        self.author = (dictionary["author"] as? String) ?? ""
        self.coverImageUrl = (dictionary["coverImageUrl"] as? String) ?? ""
        
        var bookPages = [Page]()
        if let pagesDictionaries = dictionary["pages"] as? [[String:Any]] {
            for pageDictionary in pagesDictionaries {
                if let pageText = pageDictionary["text"] as? String {
                    let page = Page(number: 1, text: pageText)
                    bookPages.append(page)
                }
            }
        }
        pages = bookPages
    }
}

class Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}
