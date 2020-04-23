//
//  PhotosCollectionViewController.swift
//  Photo Collection
//
//  Created by Marissa Gonzales on 4/23/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    
    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTheme()
        
        collectionView.reloadData()
    }
    
    func setTheme() {
        
        guard let theme = themeHelper.themePreference else { return }
        
        if theme == "Blue" {
            collectionView.backgroundColor = .blue
        } else if theme == "Dark" {
            collectionView.backgroundColor = .gray
        }

    }
    
     // MARK: - Navigation
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddPhotoSegue" {

        }
    
     }
     
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoController.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { return }
        
        let photo = photoController.photos[indexPath.item]
        
        cell.photoLabel.text = photo.title
        
        return cell
    }
}

