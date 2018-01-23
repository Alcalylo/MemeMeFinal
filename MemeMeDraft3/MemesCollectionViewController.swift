//
//  MemesCollectionViewController.swift
//  MemeMeDraft3
//
//  Created by ALCALY LO on 1/21/18.
//  Copyright © 2018 ALCALY LO. All rights reserved.
//
import Foundation
import UIKit



class MemesCollectionViewController: UICollectionViewController {

    var memes: [Meme]!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
        
        //self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(addMeme))
        //self.navigationItem.title = "Sent Memes"
        
        collectionView?.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier:"")

        // Do any additional setup after loading the view.
    }

   

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionCell", for: indexPath) as! MemeCollectionViewCell
        
        // Configure the cell
        
        let memeForRow = self.memes[(indexPath as NSIndexPath).row]
        cell.memeImageView.image = memeForRow.memedImage
        
        return cell
    }

    // MARK: UICollectionViewDelegate

        // Implement DetailViewController
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailController.detailImageView.image = self.memes[(indexPath as NSIndexPath).row].memedImage
        detailController.detailLabel.text = "\(self.memes[(indexPath as NSIndexPath).row].topText)" + " \(self.memes[(indexPath as NSIndexPath).row].bottomText) "
        
        navigationController!.pushViewController(detailController, animated: true)
    }

}

