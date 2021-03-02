//
//  TalksView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct TalksView: View {
    
    @ObservedObject var searchBar: SearchBar = SearchBar()
    
    var body: some View {
        NavigationView {
            ScrollView{
                ListMessageView()
            }
            .padding(0)
            .navigationBarTitle(Text("Talks"))
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
            .add(self.searchBar)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TalksView_Previews: PreviewProvider {
    static var previews: some View {
        TalksView()
    }
}
