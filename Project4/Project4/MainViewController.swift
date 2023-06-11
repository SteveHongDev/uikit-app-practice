//
//  MainViewController.swift
//  Project4
//
//  Created by 홍성범 on 2023/06/09.
//

import UIKit

class MainViewController: UITableViewController {
    
    var websites = ["naver.com", "google.com", "hackingwithswift.com"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "website", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = websites[indexPath.row]
        
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? ViewController {
            
            vc.website = websites[indexPath.row]
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
