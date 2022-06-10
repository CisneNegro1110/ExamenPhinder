//
//  secondView.swift
//  ExamenPhinder (iOS)
//
//  Created by Jesús Francisco Leyva Juárez on 10/06/22.
//

import SwiftUI
import Combine
/*
 > Capturar texto (Máximo 35 dígitos - Solo caracteres - UlTextField)
 > Capturar un número telefónico (Máximo 10 dígitos - UITextField)
 */

struct secondView: View {
    @ObservedObject var vm: viewModel
    @State private var isShow = false
    @State private var image: Image = Image(systemName: "person.badge.plus")
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    var body: some View {
        VStack {
            List {
                if vm.data.camara {
                    Section(header: Text("Camara")) {
                        VStack {
                            image.resizable().frame(width: 100, height: 100)
                            Button("") {
                                self.isShow.toggle()
                                self.sourceType = .camera
                            }
                            
                        }
                    }
                }
                if vm.data.foto {
                    Section(header: Text("Foto")) {
                        let urlImage = URL(string: vm.stringImage)
                        AsyncImage(url: urlImage)
                    }
                }
                if vm.data.nombre {
                    Section(header: Text("Nombre completo")) {
                        VStack {
                            TextField("", text: $vm.nombreTexto)
                            HStack {
                                Spacer()
                                Text("\(vm.nombreTexto.count) / 35")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                if vm.data.numero {
                    Section(header: Text("Número telefónico")) {
                        VStack {
                            TextField("", text: $vm.numeroTexto)
                                .keyboardType(.numberPad)
                            HStack {
                                Spacer()
                                Text("\(vm.numeroTexto.count) / 10")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                if vm.data.fecha {
                    Section(header: Text("Fecha de nacimiento")) {
                        DatePicker("Fecha", selection: $vm.secondaryData.fecha, displayedComponents: [.date])
                    }
                }
                if vm.data.sexo {
                    Section(header: Text("Sexo")) {
                        Picker("", selection: $vm.secondaryData.sexo, content: {
                            Text("Masculino").tag(0)
                            Text("Femenino").tag(1)
                        })
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                if vm.data.color {
                    Section(header: Text("Color favorito")) {
                        ColorPicker("Color", selection: $vm.secondaryData.color)
                    }
                }
            }.sheet(isPresented: $isShow) {
                AccessCamara(isShow: self.$isShow, myImage: self.$image, mySourceType: self.$sourceType)
            }
        }
    }
}
