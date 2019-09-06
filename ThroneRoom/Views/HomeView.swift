//
//  HomeView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class HomeView: UIView {
    
    public lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.text = "Welcome"
        //TODO - Add today's date
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    
    
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
        NSLayoutConstraint.activate([verseImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 15), verseImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -450), verseImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15), verseImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)])
        announcements.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([announcements.topAnchor.constraint(equalTo: verseImage.bottomAnchor, constant: 5), announcements.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15), announcements.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15), announcements.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)])
        announcementsField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([announcementsField.topAnchor.constraint(equalTo: announcements.bottomAnchor), announcementsField.leadingAnchor.constraint(equalTo: announcements.leadingAnchor),
                                     announcementsField.trailingAnchor.constraint(equalTo: announcements.trailingAnchor),
                                     announcementsField.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)])
        
        
        
    }
    
}
