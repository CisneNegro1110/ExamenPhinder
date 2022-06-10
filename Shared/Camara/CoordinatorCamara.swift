//
//  CoordinatorCamara.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import Foundation
import SwiftUI
import UIKit
class CoordinatorCamara: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @Binding var isShow: Bool
    @Binding var myImage: Image
    init(isShow: Binding<Bool>, myImage: Binding<Image>) {
        _isShow = isShow
        _myImage = myImage
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImage = Image.init(uiImage: image)
        }
        isShow = false
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isShow = false
    }
}
