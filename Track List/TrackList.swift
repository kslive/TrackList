//
//  TrackList.swift
//  Track List
//
//  Created by Eugene Kiselev on 11.07.2020.
//  Copyright © 2020 Eugene Kiselev. All rights reserved.
//

import UIKit

class TrackList: UITableViewController {

    let nameTrackArray = ["Kendrick Lamar – To Pimp a Butterfly",
                          "The Streets – Original Pirate Material",
                          "Run the Jewels – Run the Jewels 2",
                          "Kanye West – My Beautiful Dark Twisted Fantasy",
                          "Frank Ocean – Blonde",
                          "Radiohead – Hail to the Thief",
                          "Young Thug – Jeffery",
                          "Gorillaz – Demon Days",
                          "M.I.A. – Kala",
                          "Stormzy – Gang Signs & Prayer"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameTrackArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        
        cell.imageView?.image = UIImage(named: nameTrackArray[indexPath.row])
        cell.textLabel?.text = nameTrackArray[indexPath.row]
        cell.textLabel?.numberOfLines = 0

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailVC = segue.destination as! DetailVC
                detailVC.trackTitle = nameTrackArray[indexPath.row]
            }
        }
    }
}
