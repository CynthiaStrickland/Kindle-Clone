//
//  BookPageController.swift
//  Kindle Clone
//
//  Created by Cynthia Whitlatch on 2/25/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        
        navigationItem.title = self.book?.title
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        collectionView?.isPagingEnabled = true
        layout?.minimumLineSpacing = 0
        
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cell")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCloseBook))
    }

    func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCell
        
        let page = book?.pages[indexPath.row]
        pageCell.textLabel.text = page?.text
        
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = .blue
//        } else {
//            cell.backgroundColor = .red
//        }
            return pageCell
    }
    
}
