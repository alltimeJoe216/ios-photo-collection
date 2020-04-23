//
//  PhotosDetailViewController.swift
//  Photo Collection
//
//  Created by Marissa Gonzales on 4/23/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit

class PhotosDetailViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    func setTheme() {
        
        guard let theme = themeHelper?.themePreferenceKey else { return }
        
        if theme == "Blue" {
            
            view.backgroundColor = .blue
            
        } else if theme == "Dark" {
            
            view.backgroundColor = .gray
        }
    }
    
    func updateViews() {
        setTheme()
        
        guard let photo = photo else { return }
        
        imageView.image = UIImage(data: photo.imageData)
    }
    // addPhoto
    
    @IBAction func addPhoto(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    // Save Photo
    
    @IBAction func savePhoto(_ sender: Any) {
        
        guard let photoTitle = textView.text, !photoTitle.isEmpty,
            
            let photoView = imageView.image,
            
            let photoData = photoView.pngData() else { return }
        
        if let photo = photo {
            
            photoController?.update(photo: photo, data: photoData, title: photoTitle)
            
            navigationItem.title = "Update Your Photo!"
            
        } else {
            
            photoController?.create(imageData: photoData, title: photoTitle)
            
            textView.text = nil
            imageView.image = nil
            navigationItem.title = "Add a photo to your collection!"
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let originalImage = info[.originalImage] as? UIImage else { return }
        
        imageView.image = originalImage
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
