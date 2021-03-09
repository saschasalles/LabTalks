//
//  GroupsView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 20/02/2021.
//

import SwiftUI

struct GroupsView: View {

    private var groupNames = ["Alternants", "Apple Lab Confiné ", "Web M1", "Projets Apple", "INFO B3 C Suivi de projet", "Groupe Vapor", "Groupe CloudKit", "Challenge 48h", "Yann et Antoine", "App Vidéos"]

    private var colors: [Color] = [.yellow, .purple, .green]

    private var gridItemLayout = [
        GridItem(.adaptive(minimum: 120)),
        GridItem(.adaptive(minimum: 120))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, alignment: .center, spacing: 20) {
                    ForEach(0..<groupNames.count) { value in
                        NavigationLink(destination: Text("Message Group"), label: {
                            GroupItemView(groupName: groupNames[value], groupMembersCount: Int.random(in: 0..<30))
                                .contextMenu {
                                Button {
                                } label: {
                                    Label(
                                        title: { Text("New Audio Call") },
                                        icon: { Image(systemName: "phone.fill")
                                        }
                                    )
                                }
                                Button {
                                } label: {
                                    Label(
                                        title: { Text("New Video Call") },
                                        icon: { Image(systemName: "video.fill")
                                        }
                                    )
                                }
                                Button {
                                } label: {
                                    Label(
                                        title: { Text("Delete Group") },
                                        icon: { Image(systemName: "trash.fill")
                                        }
                                    )
                                }

                            }
                        }).buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 5)
                    }
                }.padding(.horizontal, 10)
            }

                .navigationBarTitle(Text("Groups"))
                .navigationBarItems(
                trailing:
                    Button(action: {
                    print("new message")
                }, label: {
                    Image(systemName: "plus.bubble")
                        .foregroundColor(Color("barBlue"))
                        .font(.title3)
                })
            )
        }
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
