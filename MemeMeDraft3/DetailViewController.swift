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
    
    @IBOutlet weak var detailLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailImageView.contentMode = .scaleAspectFit
        detailImageView.image = meme?.memedImage
        //detailLabel.text = meme?.topText
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
