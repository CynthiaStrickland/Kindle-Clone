//
//  PageCell.swift
//  Kindle Clone
//
//  Created by Cynthia Whitlatch on 2/25/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let textLabel:UILabel = {
        let pageText = UILabel()
        pageText.backgroundColor = .white
        pageText.translatesAutoresizingMaskIntoConstraints = false
        pageText.numberOfLines = 0
        
        return pageText
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        addSubview(textLabel)
        textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40).isActive = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("(InitCoder:) has not been implemented")
    }
}
