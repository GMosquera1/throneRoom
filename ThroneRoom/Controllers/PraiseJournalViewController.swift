//
//  PraiseJournalViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PraiseJournalViewController: UIViewController {
    
    let praiseReportView = PraiseJournalView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = " P R A I S E  R E P O R T S "
        self.view.backgroundColor = #colorLiteral(red: 0.7944493294, green: 0.757812798, blue: 0.9906591773, alpha: 1)
        self.view.addSubview(praiseReportView)
        praiseReportView.praiseReportTable.dataSource = self
        
        praiseReportView.praiseReportTable.delegate = self
        
        
    }
}

extension PraiseJournalViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PraiseTableViewCell") as? PraiseTableViewCell else { return UITableViewCell() }
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GROUP NAME"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200 
    }
    
}
