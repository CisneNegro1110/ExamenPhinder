//
//  principalListView.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import SwiftUI

struct principalListView: View {
    @ObservedObject var vm: viewModel
    var body: some View {
        List {
            NombreYBoton(nombre: "Camara", datoTgl: $vm.data.camara)
            NombreYBoton(nombre: "Foto", datoTgl: $vm.data.foto)
            NombreYBoton(nombre: "Nombre Completo", datoTgl: $vm.data.nombre)
            NombreYBoton(nombre: "Numero Telefonico", datoTgl: $vm.data.numero)
            NombreYBoton(nombre: "Fecha de Nacimiento", datoTgl: $vm.data.fecha)
            NombreYBoton(nombre: "Sexo", datoTgl: $vm.data.sexo)
            NombreYBoton(nombre: "Color Favorito", datoTgl: $vm.data.color)
        }
    }
}
