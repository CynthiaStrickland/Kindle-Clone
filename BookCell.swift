//
//  BookCell.swift
//  Kindle Clone
//
//  Created by Cynthia Whitlatch on 2/23/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class BookCell : UITableViewCell {
    
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .red
        
        return imageView
        
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(coverImageView)
        coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
