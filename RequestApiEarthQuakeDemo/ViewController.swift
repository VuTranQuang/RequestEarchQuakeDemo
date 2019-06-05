//
//  ViewController.swift
//  RequestApiEarthQuakeDemo
//
//  Created by Vu on 4/25/19.
//  Copyright © 2019 Vu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var dataQuake: [Features] = []
    
    var data = [EarthQuake]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DataServices.shared.requestApiQuake(completeHandle: {(quake) in
//            print(quake.features[0].mag)
//            self.anhVuNgu = quake.features[0].mag!
            self.tableView.rowHeight = 137
            self.dataQuake = quake.features
            self.tableView.reloadData()
        })
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataQuake.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
//        cell.textLabel?.text = "\(anhVuNgu[indexPath.row].mag ?? 0)"
//        let quake = data[indexPath.row]
//            cell?.lb1.text = String(quake.mag ?? 1234)
//            cell?.lb2.text = quake.place
//            cell?.lb3.text = quake.title
//            cell?.lb4.text = quake.types
//            cell?.lb5.text = String(quake.url ?? "")
        cell.magLabel.text = "\(dataQuake[indexPath.row].mag ?? 0)"
        cell.placeLabel.text = dataQuake[indexPath.row].place
        cell.timeLabel.text = dataQuake[indexPath.row].timeString
        cell.dateLabel.text = dataQuake[indexPath.row].dateString
        
        return cell
    
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

