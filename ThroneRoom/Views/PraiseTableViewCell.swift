//
//  PraiseTableViewCell.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 7/25/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PraiseTableViewCell: UITableViewCell {
    
    public var praiseContentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.9403156638, green: 0.7390406728, blue: 0.7834907174, alpha: 1)
        return contentView
    }()
    
    public var praiseGroupName: UILabel = {
        let praiseName = UILabel()
        praiseName.backgroundColor = .lightGray
        praiseName.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        praiseName.textAlignment = .left
        praiseName.font = UIFont(name: "Futura", size: 17)
        praiseName.text = "Genesis' Request"
        return praiseName
    }()
    
    public var praiseReport: UITextView = {
        let praiseReport = UITextView()
        praiseReport.backgroundColor = .white
        praiseReport.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        praiseReport.font = UIFont(name: "Futura", size: 19)
        praiseReport.text = "Here is where we will write about all of the amazing things that God has done and will do"
        return praiseReport
    }()

    public var praiseReactionPraying: UIButton = {
        let praiseReactionPraying = UIButton(type: .custom)
        praiseReactionPraying.setImage(#imageLiteral(resourceName: "icons8-pray-48").resizableImage(withCapInsets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2), resizingMode: .stretch), for: .normal)
        return praiseReactionPraying
    }()
    public var praiseReactionHeart: UIButton = {
        let praiseReactionHeart = UIButton(type: .custom)
        praiseReactionHeart.setImage(#imageLiteral(resourceName: "icons8-heart-48").resizableImage(withCapInsets: UIEdgeInsets(top: 2, left: 4, bottom: 2, right: 4), resizingMode: .stretch), for: .normal)
        return praiseReactionHeart
    }()
    
    public var praiseReactionFace: UIButton = {
        let praiseReactionFace = UIButton(type: .custom)
        praiseReactionFace.setImage(#imageLiteral(resourceName: "icons8-two-hands-48").resizableImage(withCapInsets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2), resizingMode: .stretch), for: .normal)
        return praiseReactionFace
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
        let praiseReactions = UIStackView(arrangedSubviews: [praiseReactionPraying, praiseReactionHeart,praiseReactionFace])
        praiseReactions.distribution = .fillEqually
        addSubview(praiseContentView)
        praiseContentView.addSubview(praiseGroupName)
        praiseContentView.addSubview(praiseReport)
        praiseContentView.addSubview(praiseReactions)
    praiseContentView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.bottom.equalTo(-10)
        }
        praiseGroupName.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(2)
            make.right.equalTo(-120)
        }
        
        praiseReport.snp.makeConstraints { (make) in
            make.top.equalTo(praiseGroupName.snp.bottom).offset(10)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.55)
        }
        
        praiseReactions.snp.makeConstraints { (make) in
            make.top.equalTo(praiseReport.snp.bottom).offset(5)
            make.left.equalTo(contentView.snp.left).offset(10)
            make.right.equalTo(contentView.snp.right).offset(-5)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.15)
        }
        
    }
}
