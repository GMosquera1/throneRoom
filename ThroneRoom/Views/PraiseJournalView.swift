//
//  PraiseJournalView.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit
import SnapKit

class PraiseJournalView: UIView {
   
    
    public lazy var praiseContainerView: UIView = {
        let praiseView = UIView()
        praiseView.backgroundColor = .clear
        praiseView.layer.cornerRadius = 5.0
        praiseView.layer.masksToBounds = true
        praiseView.layer.shadowColor = UIColor.lightGray.cgColor
        praiseView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        praiseView.layer.shadowRadius = 3.0
        praiseView.layer.shadowOpacity = 1.0
        praiseView.layer.masksToBounds = false
        praiseView.layer.shadowPath = UIBezierPath(roundedRect: praiseView.bounds, cornerRadius: praiseView.layer.cornerRadius).cgPath
        return praiseView
    }()

    public lazy var praiseReportTable: UITableView = {
        let praiseTable = UITableView()
        praiseTable.register(PraiseTableViewCell.self, forCellReuseIdentifier: "PraiseTableViewCell")
      praiseTable.backgroundColor = #colorLiteral(red: 0.8598231673, green: 0.75836128, blue: 0.7784464359, alpha: 1)
        return praiseTable
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
        addSubview(praiseReportTable)
        
        praiseReportTable.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
        
        
    }
    
    
}
