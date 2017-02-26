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
        
        setupNavBarButtonItems()
        fetchBooks()
        
        navigationItem.title = "KINDLE"
        tableView.register(BookCell.self, forCellReuseIdentifier: "cell")
        
        tableView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        tableView.separatorColor = UIColor(white: 1, alpha: 0.2)
        tableView.tableFooterView = UIView()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedBook = self.books?[indexPath.row]
        
        let layout = UICollectionViewFlowLayout()
        let bookPageController = BookPageController(collectionViewLayout: layout)
        
        bookPageController.book = selectedBook
        
        let navController = UINavigationController(rootViewController: bookPageController)
        present(navController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count{
            return count
        }
            return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BookCell
        
        let book = books?[indexPath.row]
        cell.book = book
        return cell
    }
    
    func setupNavBarButtonItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu.png").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(menuButtonPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon.png").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleAmazonIconPressed))
    }
    
    func handleAmazonIconPressed() {
        let amazonController = AmazonButtonController()
       
        let navController = UINavigationController(rootViewController: amazonController)
        present(navController, animated: true, completion: nil)
    }
    
    func menuButtonPressed() {
        
    }
    
    
    func fetchBooks() {
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let err = error {
                print("Failed to fetch json data", err)
                return
                }
            
            guard data != nil else {return}
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                
                guard let bookDictionaries = json as? [[String:Any]] else { return }
                
                self.books = []
                    for bookDictionary in bookDictionaries {
                        if let title = bookDictionary["title"] as? String,
                            let author = bookDictionary["author"] as? String {
                            let book = Book(title: title, author: author, pages: [], image: #imageLiteral(resourceName: "steve_jobs.jpg"))
                            self.books?.append(book)  //specify self due to retain cycles
                        }
                    }
                DispatchQueue.main.async {
                    self.tableView.reloadData()   //Dangerous to execute this on main thread
                }
            } catch let jsonError {
                print("Failed to Parse JSON properly", jsonError)
                }
            }).resume()
        }
    }
}
    
//    func setupBooks() {
//        let page1 = Page(number: 1, text: "Text for first page")
//        let page2 = Page(number: 2, text: "Text for second page")
//        
//        let pages = [page1, page2]
//        
//        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages:pages, image: #imageLiteral(resourceName: "steve_jobs.jpg"))
//        
//        for page in book.pages {
//            print(page.text)
//        }
//        
//        let book2 = Book(title: "Bill Gates Autobiography", author: "Michael Becraft", pages: [
//            
//            Page(number: 1, text: "Text for Page 1"),
//            Page(number: 2, text: "Text for Page 2"),
//            Page(number: 3, text: "Text for Page 3"),
//            Page(number: 4, text: "Text for Page 4"),
//            Page(number: 1, text: "Text for Page 5")
//            
//            ], image: #imageLiteral(resourceName: "bill_gates.jpg"))
//        
//        self.books = [book, book2]
//    }


