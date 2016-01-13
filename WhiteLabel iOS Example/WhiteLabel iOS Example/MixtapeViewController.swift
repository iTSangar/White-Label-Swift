//
//  DetailViewController.swift
//  WhiteLabel iOS Example
//
//  Created by Alexander Givens on 12/29/15.
//  Copyright © 2015 Noon Pacific. All rights reserved.
//

import UIKit

class MixtapeViewController: UITableViewController {

    var mixtape: Mixtape? {
        didSet {
            configureView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    func configureView() {
        if let mixtape = self.mixtape {
            WhiteLabel.getTracksforMixtape(mixtape, completionHandler: { tracks, error in
                self.tableView.reloadData()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let tracks = self.mixtape?.tracks {
            return tracks.count
        }
        
        return 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath)
        
        if let tracks = self.mixtape?.tracks {
            let track = tracks[indexPath.row]
            cell.textLabel!.text = track.title
            cell.detailTextLabel!.text = track.artistName
        }
        
        return cell
    }
}

