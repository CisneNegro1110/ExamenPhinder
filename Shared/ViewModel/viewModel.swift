//
//  viewModel.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import Foundation
import SwiftUI
class viewModel: ObservableObject {
    @Published var data = principalDataModel(
        camara: false, foto: false, nombre: false, numero: false, fecha: false, sexo: false, color: false)
    
    
    @Published var secondaryData = secondaryDataModel(
        fecha: Date(), sexo: 0, color: .blue)

    
    @Published var stringImage =
    "https://http2.mlstatic.com/vegeta-tamano-real-para-armar-en-papercraft-D.NQ_NP_892880-MLA26232224460_102017-F.jpg"
    
    
    
    @Published var nombreTexto = "" {
        didSet {
            if nombreTexto.count > 35 && oldValue.count <= 35 {
                self.nombreTexto = oldValue
            }
        }
    }
    
    
    @Published var numeroTexto = "" {
        didSet {
            if numeroTexto.count > 10 && oldValue.count <= 10 {
                self.numeroTexto = oldValue
            }
        }
    }
    
    
    func comprobar() -> Int {
      if (data.camara  || data.foto || data.nombre || data.numero || data.fecha || data.sexo || data.color) == true {
            return 1
        }
        return 0
    }
    
}
