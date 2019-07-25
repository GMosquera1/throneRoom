//
//  BibleView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import WebKit

class BibleView: UIView {

    public lazy var bibleView: WKWebView = {
       let bibleView = WKWebView()
        return bibleView
    }()

}
