//
//  SettingViewController.swift
//  DIGA
//
//  Created by Shogo Kanechika on 2022/07/19.
//

import Foundation
import UIKit
import AWSMobileClient




final class SettingViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    @IBOutlet weak var userImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        guard let username = AWSMobileClient.default().username else {
            print("Error: Uncaught username")
            return
        }
        userName.text = username
    }

    
    @IBOutlet weak var userName: UILabel!

    
    
    @IBAction func didTapImage(_ sender: UIButton) {
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let addImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            userImage.contentMode = .scaleAspectFit
            userImage.image = addImage
        }
        
        var documentsUrl: URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
        let fileURL = documentsUrl.appendingPathComponent("userImage")
        
        guard let imageData = userImage.image?.jpegData(compressionQuality: 1.0) else {
            return
        }
        do {
            try imageData.write(to: fileURL, options: .atomic)
            print("Image saved.")
        } catch {
            print("Failed to save the image:", error)
        }
        
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
