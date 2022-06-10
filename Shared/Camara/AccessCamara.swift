//
//  AccessCamara.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import Foundation
import SwiftUI
import UIKit
struct AccessCamara: UIViewControllerRepresentable {
    @Binding var isShow: Bool
    @Binding var myImage: Image
    @Binding var mySourceType: UIImagePickerController.SourceType
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<AccessCamara>) {
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<AccessCamara>) -> UIImagePickerController {
        let obj = UIImagePickerController()
        obj.sourceType = mySourceType
        obj.delegate = context.coordinator
        return obj
    }
    
    func makeCoordinator() -> CoordinatorCamara {
        return CoordinatorCamara(isShow: $isShow, myImage: $myImage)
    }
    
}
