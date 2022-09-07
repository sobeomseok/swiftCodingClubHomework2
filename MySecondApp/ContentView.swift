//
//  ContentView.swift
//  MySecondApp
//
//  Created by 소범석 on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    @State private var editMode = EditMode.inactive
    
    var student = Members()
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        Image(systemName: student.menber[0].imageName)
                        Text(student.menber[0].name)
                    }
                    HStack {
                        Image(systemName: student.menber[1].imageName)
                        Text(student.menber[1].name)
                    }
                    HStack {
                        Image(systemName: student.menber[2].imageName)
                        Text(student.menber[2].name)
                    }
                } header: {
                    HStack {
                        Image(systemName: "bolt")
                        Text("A CLASS")
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: student.menber[0].imageName)
                        Text(student.menber[0].name)
                    }
                    HStack {
                        Image(systemName: student.menber[1].imageName)
                        Text(student.menber[1].name)
                    }
                    HStack {
                        Image(systemName: student.menber[2].imageName)
                        Text(student.menber[2].name)
                    }
                } header: {
                    HStack {
                        Text("B CLASS")
                    }
                }
                
                Section {
                    HStack {
                        Image(systemName: student.menber[0].imageName)
                        Text(student.menber[0].name)
                    }
                    HStack {
                        Image(systemName: student.menber[1].imageName)
                        Text(student.menber[1].name)
                    }
                    HStack {
                        Image(systemName: student.menber[2].imageName)
                        Text(student.menber[2].name)
                    }
                } header: {
                    HStack {
                        Text("C CLASS")
                    }
                } footer: {
                    Text("copy right by Bas")
                }
            }
            .toolbar {
                // Edit Button
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Edit") {
                        print("DEBUG: Edit button Tapped")
                    }
                }
                // Add Button
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("DEBUG: button tapped")
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Member {
    let name: String
    let imageName: String
}

struct Members {
    let menber = [
        Member(name: "Bas", imageName: "heart"),
        Member(name: "Leeo", imageName: "heart.fill"),
        Member(name: "Lia", imageName: "bolt")
    ]
}
