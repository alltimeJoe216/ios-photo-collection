//
//  PhotosCollectionViewCell.swift
//  Photo Collection
//
//  Created by Marissa Gonzales on 4/23/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var photo: Photo? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)  
        photoLabel.text = photo.title
    }
    
    
}
