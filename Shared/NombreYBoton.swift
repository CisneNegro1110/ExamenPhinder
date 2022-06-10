//
//  NombreYBoton.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import SwiftUI

struct NombreYBoton: View {
    let nombre: String
    @Binding var datoTgl: Bool
    var body: some View {
        VStack {
            HStack {
                Text(nombre)
                Spacer()
                Button(action: {
                    datoTgl.toggle()
                }, label: {
                    datoTgl ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                })
                .foregroundColor(.blue)
            }.padding()
        }
    }
}
