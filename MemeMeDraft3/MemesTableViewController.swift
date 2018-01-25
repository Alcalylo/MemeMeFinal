//
//  MemesTableViewController.swift
//  MemeMeDraft3
//
//  Created by ALCALY LO on 1/21/18.
//  Copyright © 2018 ALCALY LO. All rights reserved.
//
import Foundation
import UIKit

class MemesTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var memes: [Meme]!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        tableView.reloadData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableCell", for: indexPath)

        // Configure the cell
 
        let memeForCell = self.memes[(indexPath as NSIndexPath).row]
        cell.imageView?.image = memeForCell.memedImage
        cell.imageView?.contentMode = .scaleAspectFit
        
        return cell
    }
    
    // Implement DetailViewcontroller
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        navigationController!.pushViewController(detailController, animated: true)
    }
    
}

 

