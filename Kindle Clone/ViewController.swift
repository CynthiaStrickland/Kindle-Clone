//
//  ViewController.swift
//  Kindle Clone
//
//  Created by Cynthia Whitlatch on 2/22/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        navigationItem.title = "KINDLE"
        setupBooks()
        
    }
    
    func setupBooks() {
        let page1 = Page(number: 1, text: "Text for first page")
        let page2 = Page(number: 2, text: "Text for second page")
        
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages:pages)
        
        for page in book.pages {
            print(page.text)
        }
        
        let book2 = Book(title: "Bill Gates Autobiography", author: "Michael Becraft", pages: [
            
            Page(number: 1, text: "Text for Page 1"),
            Page(number: 2, text: "Text for Page 2"),
            Page(number: 3, text: "Text for Page 3"),
            Page(number: 4, text: "Text for Page 4"),
            Page(number: 1, text: "Text for Page 5")
            
            ])
        
        self.books = [book, book2]
    }
}

