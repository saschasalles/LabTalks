//
//  TalksView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 15/02/2021.
//

import SwiftUI

struct TalksView: View {
    var body: some View {
        NavigationView {
            List{
                ListMessageView()
            }.listStyle(InsetGroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
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
        }
    }
}

struct TalksView_Previews: PreviewProvider {
    static var previews: some View {
        TalksView()
    }
}
