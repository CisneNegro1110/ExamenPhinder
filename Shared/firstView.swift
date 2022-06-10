//
//  firstView.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import SwiftUI

struct firstView: View {
    @StateObject var vm = viewModel()
    @State private var showAlert = false
    @State private var tglView = false
    @State var result = 0
    var body: some View {
        NavigationView {
            VStack {
                principalListView(vm: vm)
                Button("Siguiente") {
                    result = vm.comprobar()
                    if result == 1 {
                        tglView = true
                    }else {
                        showAlert = true
                    }
                }
                NavigationLink("", isActive: $tglView, destination: {
                    secondView(vm: vm)
                })
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Alerta!"),
                    message: Text("Debes de seleccionar al menos un elemento.")
                )
            }
            .navigationTitle("Datos")
        }
    }
}

struct firstView_Previews: PreviewProvider {
    static var previews: some View {
        firstView()
    }
}
