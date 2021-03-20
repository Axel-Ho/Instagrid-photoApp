//
//  ViewController.swift
//  Instagrid
//
//  Created by Hoberdon Axel on 19/02/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - @IBOutlet
    
    @IBOutlet weak var placementView: placementView!
    @IBOutlet private var tableImage: [UIImageView]?
    @IBOutlet weak var swipe: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    @IBOutlet weak var swipeUpView: arrowSwipeUp!
      
    
    // MARK: - @IBAction
    
    @IBAction func chargeImage(_ sender: UIButton) {
        tag = sender.tag
        pickAnImage()
//        print(tag!)
    }
    @IBAction func didTapDispo1(_ sender: Any) {
        placementView.startDispo1()
    }
    @IBAction func didTapDispo2(_ sender: Any) {
        placementView.startDispo2()
    }
    @IBAction func didTapDispo3(_ sender: Any) {
        placementView.startDispo3()
    }
    
    
    // MARK: - Variables
    
    private var tag: Int?
    private var swipeToShare: UISwipeGestureRecognizer?

    
    // MARK: - viewDidLoad view loaded at launching of application
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        placementView.startDispo1()
        swipeToShare = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(_: )))
        swipeToShare?.direction = .up
        swipeUpView.addGestureRecognizer(swipeToShare!)
        
        }
    
    // MARK: - Function to choose an image
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        création variable image qu'on attribue à l'image du picker et on s'assure que c'est bien un UImage
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
//              on "garde" la condition tagUnwrap = tag tant qu'elle est vraie sinon on return rien puis on affilie/couple l'image du numéro de tag selectionné à la variable image crée au dessus
            guard let tagUnwrap = tag else { return }
            tableImage?[tagUnwrap].image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
  
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func pickAnImage () {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }

    
    // MARK: - Manage orientation device
    
    override func viewWillTransition(to size: CGSize,
                            with coordinator: UIViewControllerTransitionCoordinator){
       orientationDevice()
    }
    
    func orientationDevice () {
        if UIDevice.current.orientation == .landscapeRight ||  UIDevice.current.orientation == .landscapeLeft{
            print("Lansacape")
            swipe.text = "Swipe left to share"
            arrow.transform = CGAffineTransform(rotationAngle: (-90.0 * .pi) / 180.0)
        } else if UIDevice.current.orientation.isPortrait {
            swipe.text = "Swipe up to share"
            arrow.transform = CGAffineTransform.identity
        }
    }
    
    // MARK: - Function that manage the swipeUp

    @objc
    func swipeUp (_ sender: UISwipeGestureRecognizer) {
        switch sender.state {
        case .ended, .cancelled:
            print("Ouverture de l'UIActivityViewController")
            presentActivityController()
        default:
            break
        }
    }
    
    // MARK: - Function that diplays the UIActivityViewController
    
    @objc
      private func presentActivityController() {
        
        let renderer = UIGraphicsImageRenderer(size: placementView.bounds.size)

        let image = renderer.image { context in
            view.drawHierarchy(in: placementView.bounds, afterScreenUpdates: false)
        }
        
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        present(activityVC, animated: true)
      }
    

    
}

