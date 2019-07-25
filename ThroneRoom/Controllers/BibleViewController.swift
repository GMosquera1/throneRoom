//
//  BibleViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import WebKit

class BibleViewController: UIViewController, WKNavigationDelegate {

    private var bibleView = BibleView()
    var webView: WKWebView!
    
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.bible.com/bible/1/GEN.1.KJV")!
        webView.load(URLRequest(url: url))
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector (webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
        navigationItem.title = " B I B L E "
        view.addSubview(bibleView)
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
}
