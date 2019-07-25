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
        contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return contentView
    }()
    
    public var prayerGroupName: UILabel = {
        let prayerName = UILabel()
        prayerName.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        prayerName.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        prayerName.font = UIFont(name: "Futura", size: 17)
        return prayerName
    }()
    
    public var prayerRequest: UITextView = {
        let prayerRequest = UITextView()
        prayerRequest.backgroundColor = .white
        prayerRequest.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        prayerRequest.font = UIFont(name: "Futura", size: 19)
        return prayerRequest
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
        let prayerReactions = UIStackView(arrangedSubviews: [prayerReactionHeart,prayerReactionFace, prayerReactionPraying])
        prayerReactions.distribution = .fillEqually
        addSubview(prayerContentView)
        prayerContentView.addSubview(prayerGroupName)
        prayerContentView.addSubview(prayerRequest)
        prayerContentView.addSubview(prayerReactions)
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
        
        prayerRequest.snp.makeConstraints { (make) in
            make.top.equalTo(prayerGroupName.snp.bottom).offset(10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.55)
        }
        
        prayerReactions.snp.makeConstraints { (make) in
            make.top.equalTo(prayerRequest.snp.bottom).offset(5)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-5)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.15)
        }
        
    }
}
