//
//  DetailViewController.swift
//  MemeMeDraft3
//
//  Created by ALCALY LO on 1/23/18.
//  Copyright © 2018 ALCALY LO. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var meme : Meme?
    
    @IBOutlet weak var detailImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.image = meme?.memedImage
    }
    
}
