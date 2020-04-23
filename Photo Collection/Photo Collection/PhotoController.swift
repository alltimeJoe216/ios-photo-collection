//
//  PhotoController.swift
//  Photo Collection
//
//  Created by Marissa Gonzales on 4/23/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import Foundation

class PhotoController {
    
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        
        var photo = Photo(imageData: imageData, title: title)
        
        photos.append(photo)
    }
    
    func update(photo: Photo, data: Data, title: String) {
        
        guard let index = photos.firstIndex(of: photo) else { return }
        
        photos[index].imageData = data
        photos[index].title = title
        
    }
}
