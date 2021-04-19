//
//  CaptureImageView.swift
//  CoffeeGuild
//
//  Created by Luca Lo Forte on 19/4/21.
//

import SwiftUI

struct CaptureImageView : UIViewControllerRepresentable {
    
    @Binding var isShown : Bool
    @Binding var image : UIImage?
    
    func makeCoordinator() -> Coordinator {
        CaptureImageView.Coordinator(isShown: $isShown, image: $image)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<CaptureImageView>) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

extension CaptureImageView {
    
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        @Binding var isCoordinatorShown: Bool
        @Binding var imageInCoordinator: UIImage?
        
        init(isShown: Binding<Bool>, image: Binding<UIImage?>) {
            _isCoordinatorShown = isShown
            _imageInCoordinator = image
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                guard let unwrapImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
                imageInCoordinator = unwrapImage
                isCoordinatorShown = false
            }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isCoordinatorShown = false
        }
    }
    
}
