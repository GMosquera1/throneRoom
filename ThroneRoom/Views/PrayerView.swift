//
//  PrayerView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import SnapKit

class PrayerView: UIView {
    
    public lazy var prayerContainerView: UIView = {
        let prayerView = UIView()
        prayerView.backgroundColor = .clear
        prayerView.layer.cornerRadius = 2.0
        prayerView.layer.masksToBounds = true
        prayerView.layer.shadowColor = UIColor.lightGray.cgColor
        prayerView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        prayerView.layer.shadowRadius = 3.0
        prayerView.layer.shadowOpacity = 1.0
        prayerView.layer.masksToBounds = false
        prayerView.layer.shadowPath = UIBezierPath(roundedRect: prayerView.bounds, cornerRadius: prayerView.layer.cornerRadius).cgPath
        return prayerView
    }()
    
    
    public lazy var prayerRequestTable: UITableView = {
        let prayerTable = UITableView()
        prayerTable.estimatedRowHeight = 12.0
        return prayerTable
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
    setConstraints()
}

    func setConstraints() {
        addSubview(prayerRequestTable)
        
        prayerRequestTable.snp.makeConstraints { (make) in
            make.top.equalTo(snp_top)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
        
    }


}
