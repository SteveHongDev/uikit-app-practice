//
//  ViewController.swift
//  Project1
//
//  Created by 홍성범 on 2023/06/02.
//

import UIKit

class ViewController: UITableViewController {
    
    
    var pictures = [String]()
    
    var numOfPictures = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
                numOfPictures += 1
            }
        }
        
        pictures.sort()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        content.text = pictures[indexPath.row]
        content.textProperties.font = .systemFont(ofSize: 20)
        cell.contentConfiguration = content
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 1. load detail view controller
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            // success
            vc.selectedImage = pictures[indexPath.row]
            vc.numOfCurrent = indexPath.row + 1
            vc.title = "Picture \(vc.numOfCurrent) of \(numOfPictures)"
            
            // push
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

