//
//  GroupsView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 20/02/2021.
//

import SwiftUI

struct GroupsView: View {
    
    private var groupNames = ["Alternants", "Apple Lab 2020", "Web M1", "Projets Apple", "Web B2", "Groupe Vapor", "Groupe CloudKit", "Challenge 48h", "Yann et Antoine", "App Vidéos"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var gridItemLayout = [GridItem(.flexible(minimum: 120, maximum: 220)), GridItem(.flexible(minimum: 120, maximum: 220))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(0..<groupNames.count) {
                        GroupItemView(groupName: groupNames[$0])
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
