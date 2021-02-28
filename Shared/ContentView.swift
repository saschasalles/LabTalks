//
//  ContentView.swift
//  Shared
//
//  Created by Sascha Sallès on 12/02/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var context
    @State private var selection: Int = 0
    
    var body: some View {
        #if os(iOS)
        TabView(selection: self.$selection) {
            TalksView()
                .tabItem {
                    Text("Talks")
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                }.tag(1)
            GroupsView()
                .tabItem {
                    Text("Groups")
                    Image(systemName: "rectangle.3.offgrid.bubble.left.fill")
                }.tag(2)
            Text("Tab Content 3")
                .tabItem {
                    Text("Friends")
                    Image(systemName: "chevron.right.circle.fill")
                }.tag(3)
            Text("Tab Content 4")
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }.tag(4)
        }.accentColor(Color("barBlue"))
        #endif
    }
    
    
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
