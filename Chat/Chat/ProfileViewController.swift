//
//  ProfileViewController.swift
//  Chat
//
//  Created by vikiwai on 23.09.2020.
//  Copyright © 2020 vikiwai. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: — UI elements
    
    @IBOutlet weak var profilePhotoView: UIView!
    @IBOutlet weak var profileFullNameLabel: UILabel!
    @IBOutlet weak var profileDecriptionLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var firstNameCharacter: UILabel!
    @IBOutlet weak var secondNameCharacter: UILabel!
    
    // MARK: — Private propety
    
    private let imagePicker = UIImagePickerController()
    
    // MARK: — Actions
    
    @IBAction func didEditButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Выберите новую аватарку!", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Установить фото из галереи", style: .default , handler: { (UIAlertAction) in
            self.choosePhotoFromGallery()
        }))

        alert.addAction(UIAlertAction(title: "Сделать фото", style: .default , handler:{ (UIAlertAction) in
            self.takePhoto()
        }))

        alert.addAction(UIAlertAction(title: "Отменить", style: .cancel, handler:{ (UIAlertAction) in
            return
        }))

        self.present(alert, animated: true, completion: {
            return
        })
    }
    
    @IBAction func didSaveButtonTapped(_ sender: Any) {
        saveButton.isEnabled = false
    }
    
    // MARK: — Life cycle
    
    convenience init() {
        self.init()
        print(saveButton.frame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(saveButton.frame)
        
        setNameCharacters()
        
        imagePicker.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(saveButton.frame)
    }
    
    // MARK: — UIImagePickerControllerDelegate methods
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            UIGraphicsBeginImageContext(profilePhotoView.frame.size)
            pickedImage.drawAsPattern(in: profilePhotoView.bounds)
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
            resetNameCharacters()
            profilePhotoView.backgroundColor = UIColor(patternImage: image)
            
            // Я сдаюсь, image никак не отправляется в uiview...............................
            // Потому что хочется сохранить параметры uiview
            
            /*
            let imageLayer = CALayer()
            let imageLayer = pickedImage.cgImage
            imageLayer.frame = profilePhotoView.bounds
            imageLayer.contents = myImage
            profilePhotoView.layer.addSublayer(imageLayer)*/
        }
     
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: — Private methods
    
    private func choosePhotoFromGallery() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
            
        present(imagePicker, animated: true, completion: nil)
    }
    
    private func takePhoto() {
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }

    private func setNameCharacters() {
        if let firstName = profileFullNameLabel.text {
            firstNameCharacter.text = String(firstName.prefix(1))
        }
        
        if let secondName = profileFullNameLabel.text {
            secondNameCharacter.text = String(secondName.components(separatedBy: " ")[1].prefix(1))
        }
    }
    
    private func resetNameCharacters() {
        firstNameCharacter.text = ""
        secondNameCharacter.text = ""
    }
}
