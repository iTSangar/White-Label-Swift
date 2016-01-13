//
//  MasterViewController.swift
//  WhiteLabel iOS Example
//
//  Created by Alexander Givens on 12/29/15.
//  Copyright © 2015 Noon Pacific. All rights reserved.
//

import UIKit

class CollectionViewController: UITableViewController {

    var mixtapeViewController: MixtapeViewController? = nil
    var objects = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.mixtapeViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? MixtapeViewController
        }
        
        WhiteLabel.getMixtapes { mixtapes, error in
            self.tableView.reloadData()
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMixtape" {
            if let indexPath = self.tableView.indexPathForSelectedRow, let mixtapes = WhiteLabel.collection.mixtapes {
                let mixtape = mixtapes[indexPath.row]
                let mixtapeViewController = (segue.destinationViewController as! UINavigationController).topViewController as! MixtapeViewController
                mixtapeViewController.mixtape = mixtape
                mixtapeViewController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                mixtapeViewController.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let mixtapes = WhiteLabel.collection.mixtapes {
            return mixtapes.count
        }
        
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MixtapeCell", forIndexPath: indexPath)
        
        if let mixtapes = WhiteLabel.collection.mixtapes {
            let mixtape = mixtapes[indexPath.row]
            cell.textLabel!.text = mixtape.name
            cell.detailTextLabel!.text = String(mixtape.trackCount)
        }
        
        return cell
    }



}

