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
        pageText.text = "Page1dalkjf;alskdjf;alskjdf;lksdjf;lkdsjf;lkdjf;lkdjaf;lkdjs;lfkj;dlkfj;sdlkfj;sdlkjf;sdlkjf;lsdkjf;lsdkjf;ldskjf;lskdjf;lsdkjf;lsdkjf;sldkjf;slkjdf;lskdjf;lksdjf;lkdsjf;lskdjf;sldkjf;lkajsdf;lksjf;lkdj;flkjd;alkfj;aldkjf;alksdjf;laksjdf;lkdsaj;ldkj;lfkjas;ldkjf;lskdajf;lksdjf;lkdsjf;lksdjf;lksdj;lfkjsd;lkjf;lsdkjf;lskdjf;lksdjf;lskjdf;lkasjdf;lkdsjf;lskdjf;lkdjf;lksjd;flkjsd;flkjasd;lfkjds;lkfj;ladskjf;lskdjf;lksadj;flkja;dlkjf;ladksjf;lkadsjf;lksdjf;lksdjf;lskdjaf;lksdjf;lkjas;ldkjf;alkdjf;lksdjf;lkjdsf"
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
