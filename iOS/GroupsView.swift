//
//  GroupsView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 20/02/2021.
//

import SwiftUI

struct GroupsView: View {
    
    private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]
    
    private var colors: [Color] = [.yellow, .purple, .green]
    
    private var gridItemLayout = [GridItem(.flexible(minimum: 120, maximum: 220)), GridItem(.flexible(minimum: 120, maximum: 220))]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(0..<symbols.count) {
                        GroupItemView(groupName: symbols[$0])
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
