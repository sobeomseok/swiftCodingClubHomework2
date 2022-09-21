//
//  ContentView.swift
//  MySecondApp
//
//  Created by 소범석 on 2022/09/05.
//

import SwiftUI

struct ContentView: View {
    @State private var editMode = EditMode.inactive
    @State var MemberList = [Member]()
    @State var member = Members().member
    @State var studentGrade: String = ""
    @State var studentname: String = ""
    @State var showAddButtonView: Bool = false
    @State var isPresentModal = false
    
    init() {
        _MemberList = State(initialValue: member)
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    Section {
                        ForEach(MemberList, id: \.grade) { member in
                            HStack {
                                Image(systemName: member.imageName ?? "")
                                Text(member.name)
                            }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    } header: {
                        HStack {
                            Image(systemName: "bolt")
                            Text("A CLASS")
                        }
                    }
                    
                    Section {
                        ForEach(MemberList, id: \.name) { member in
                            HStack {
                                Image(systemName: member.imageName ?? "")
                                Text(member.name)
                            }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    } header: {
                        HStack {
                            Text("B CLASS")
                        }
                    }
                    
                    Section {
                        ForEach(MemberList, id: \.name) { member in
                            HStack {
                                Image(systemName: member.imageName ?? "")
                                Text(member.name)
                            }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    } header: {
                        HStack {
                            Text("C CLASS")
                        }
                    } footer: {
                        Text("copy right by Bas")
                    }
                }
                
                .onAppear(perform: {
                    UITableView.appearance().contentInset.top = -25
                })
                .toolbar {
                    // Edit Button
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    // Add Button
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            self.isPresentModal.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        })
                    }
                    
                }
                .navigationBarTitle("", displayMode: .inline)
                .sheet(isPresented: $isPresentModal) {
                    AddMember(isPresented: $isPresentModal, didAddMember: { member in
//                        print(member.name)
                        self.MemberList.append(member)
                        print("DEBUG: \(MemberList.description)")
                    })
                }
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        member.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        member.move(fromOffsets: indices, toOffset: newOffset)
    }
    
}

struct AddMember: View {
    @State var selectedClass: classes = .A
    @State var name: String = ""
    @Binding var isPresented: Bool
    
    var didAddMember: (Member) -> ()
    
    var body: some View {
        VStack {
            mainView
        }
        Spacer()
    }
    
    var mainView: some View {
        VStack {
            Picker("Choose a Class", selection: $selectedClass) {
                ForEach(classes.allCases, id: \.self) { classes in
                    Text("\(classes.rawValue)")
                }
            }
            .pickerStyle(.segmented)
            .padding([.leading, .top, .trailing])
            
            TextField("Enter Your name", text: $name)
                .padding(16)
                .background(Color.gray.opacity(0.09))
                .padding([.leading, .trailing])
                .cornerRadius(5)
            
            Button {
                self.isPresented = false
                self.didAddMember(.init(name: self.name, grade: self.selectedClass))
            } label: {
                Text("Add")
                    .frame(maxWidth: .infinity, maxHeight: 44)
                    .background(.blue)
                    .tint(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding([.leading, .trailing])
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: - Helpers
enum classes: String, Equatable, CaseIterable {
    case A = "A Class"
    case B = "B Class"
    case C = "C Class"
}

struct Member: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var imageName: String?
    var grade: classes
}

struct Members {
    var member = [
        Member(name: "Bas", imageName: "heart", grade: .A),
        Member(name: "Leeo", imageName: "heart.fill", grade: .B),
        Member(name: "Lia", imageName: "bolt", grade: .C)
    ]
}



