//
//  AmazonButtonController.swift
//  Kindle Clone
//
//  Created by Cynthia Whitlatch on 2/25/17.
//  Copyright © 2017 Fenix Design. All rights reserved.
//

import UIKit
import WebKit

class AmazonButtonController : UIViewController, UIWebViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCloseAmazon))

        let webV:UIWebView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        let url = URL (string: "http://www.amazon.com");
        let request = URLRequest(url: url!);
        webV.loadRequest(request);
        webV.delegate = self
    }

    func handleCloseAmazon() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
