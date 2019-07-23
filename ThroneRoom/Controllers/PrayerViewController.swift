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
        prayerView.prayerRequestTable.rowHeight = UITableView.automaticDimension
        prayerView.prayerRequestTable.estimatedRowHeight = 600
        //prayerView.prayerRequestTable.delegate = self
        
        
    }
   // tableView - header sections equivalent to groups
    // cells will hold the prayers
    // cells segue to full view prayer corner which includes name, prayer, discussion, and reactions.
    
    func prayerRequestsTableViewDisplay() {
        
    }

}
extension PrayerViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hola Cell"
        cell.imageView?.image = #imageLiteral(resourceName: "icons8-handshake-heart-32")
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GROUP NAME"
    }
}

