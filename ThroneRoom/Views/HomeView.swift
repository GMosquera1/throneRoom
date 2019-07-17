//
//  HomeView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import SnapKit

class HomeView: UIView {

    public lazy var verseImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "versePlaceHolder"))
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 10.0
        return image
    }()
    public lazy var announcementsField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.font = UIFont(name: "Geneva", size: 20)
        textView.text = " Verse of the Day "
        textView.isEditable = false
        return textView
    }()

    public lazy var announcements: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        textView.textAlignment = .center
        textView.font = UIFont.boldSystemFont(ofSize: 20)
        textView.font = UIFont(name: "Geneva", size: 20)
        textView.text = " News "
        textView.isEditable = false
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    func commonInit() {
        SetConstraints()
    }
    func SetConstraints(){
        addSubview(verseImage)
        addSubview(announcements)
        addSubview(announcementsField)

        verseImage.translatesAutoresizingMaskIntoConstraints = false
        announcements.translatesAutoresizingMaskIntoConstraints = false
        announcementsField.translatesAutoresizingMaskIntoConstraints = false

        verseImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        verseImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -450).isActive = true
        verseImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        verseImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        
        
        announcements.topAnchor.constraint(equalTo: verseImage.bottomAnchor, constant: 5).isActive = true
        announcements.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        announcements.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        announcements.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        announcementsField.topAnchor.constraint(equalTo: announcements.bottomAnchor).isActive = true
        announcementsField.leadingAnchor.constraint(equalTo: announcements.leadingAnchor).isActive = true
        announcementsField.trailingAnchor.constraint(equalTo: announcements.trailingAnchor).isActive = true
    announcementsField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05).isActive = true
        
        
//        activityIndicator.centerYAnchor.constraint(equalTo: venueImage.centerYAnchor, constant: 0).isActive = true
//        activityIndicator.centerXAnchor.constraint(equalTo: venueImage.centerXAnchor, constant: 0).isActive = true
    }
    
}
