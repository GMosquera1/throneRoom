//
//  PrayerTableViewCell.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 7/24/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PrayerTableViewCell: UITableViewCell {
    
        public var prayerContentView: UIView = {
            let contentView = UIView()
            return contentView
        }()
        public var prayerGroupName: UILabel = {
            let prayerName = UILabel()
            prayerName.text = "Genesis' request"
            return prayerName
        }()
        
        public var prayerRequest: UITextView = {
            let prayerRequest = UITextView()
            return prayerRequest
        }()
        
        public var prayerReactions: UIStackView = {
            let prayerReactions = UIStackView()
            return prayerReactions
        }()
        
        public var prayerReactionPraying: UIButton = {
            let prayerReactionPraying = UIButton(type: .custom)
            prayerReactionPraying.setImage(#imageLiteral(resourceName: "icons8-handshake-heart-32"), for: .normal)
            return prayerReactionPraying
        }()
        public var prayerReactionHeart: UIButton = {
            let prayerReactionHeart = UIButton(type: .custom)
            prayerReactionHeart.setImage(#imageLiteral(resourceName: "icons8-home-page-32"), for: .normal)
            return prayerReactionHeart
        }()
    
    public var prayerReactionFace: UIButton = {
        let prayerReactionFace = UIButton(type: .custom)
        prayerReactionFace.setImage(#imageLiteral(resourceName: "icons8-task-32"), for: .normal)
        return prayerReactionFace
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        commonInit()
    }
    
        func commonInit() {
            setConstraints()
        }
        
        func setConstraints() {
        addSubview(prayerContentView)
        prayerContentView.addSubview(prayerGroupName)
            
            prayerContentView.snp.makeConstraints { (make) in
                make.top.equalTo(10)
                make.left.equalTo(10)
                make.right.equalTo(-10)
                make.bottom.equalTo(-10)
            }
            prayerGroupName.snp.makeConstraints { (make) in
                make.top.equalTo(5)
                make.left.equalTo(2)
                make.right.equalTo(-20)
            }
//            prayerRequest.snp.makeConstraints { (make) in
//                make.top
//            }
            
        }
    }
