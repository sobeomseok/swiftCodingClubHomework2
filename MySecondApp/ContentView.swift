//
//  ContentView.swift
//  MySecondApp
//
//  Created by 소범석 on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    var student = Members()
    
    var body: some View {
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
