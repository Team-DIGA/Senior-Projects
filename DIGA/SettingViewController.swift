//
//  SettingViewController.swift
//  DIGA
//
//  Created by Shogo Kanechika on 2022/07/19.
//

import Foundation
import UIKit


final class SettingViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    
    @IBOutlet weak var userImage: UIImageView!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
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
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
