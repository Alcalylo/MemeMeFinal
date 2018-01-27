//
//  MemesCollectionViewController.swift
//  MemeMeDraft3
//
//  Created by ALCALY LO on 1/21/18.
//  Copyright © 2018 ALCALY LO. All rights reserved.
//
import Foundation
import UIKit

class MemesCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    // MARK: Properties
    
    var memes: [Meme]!
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 5.0, bottom: 0, right: 5.0)
    fileprivate let itemsPerRow: CGFloat = 3
    
    // MARK: Outlets
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //MARK : Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        collectionView!.reloadData()
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
        cell.memeImageView.contentMode = .scaleAspectFit
        
        return cell
    }
    
    // Configure the Collection View
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return sectionInsets.left
    }
    
    // MARK: Implement Detail View Controller
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        detailController.meme = self.memes[(indexPath as NSIndexPath).row]
        
        navigationController!.pushViewController(detailController, animated: true)
    }
    
}

