//
//  PrayerViewController.swift
//  ThroneRoom
//
//  Created by Genesis Mosquera on 6/16/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class PrayerViewController: UIViewController {

    let prayerView = PrayerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = " P R A Y E R  L I S T"
        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.view.addSubview(prayerView)
        prayerView.prayerRequestTable.dataSource = self
        prayerView.prayerRequestTable.delegate = self

    
   // tableView - header sections equivalent to groups
    // cells will hold the prayers
    // cells segue to full view prayer corner which includes name, prayer, discussion, and reactions
    // make it so that people can toggle between displaying name or remaining anonymous

}
}
extension PrayerViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PrayerTableViewCell") as? PrayerTableViewCell else { return UITableViewCell()}
        cell.prayerGroupName.text = "Alan's Prayer Request"
        cell.prayerRequest.text = "Trying to be more like God, in His meekness. Wisdom to dicepher gray areas more efficiently"
        cell.backgroundColor = .clear
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GROUP NAME"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
