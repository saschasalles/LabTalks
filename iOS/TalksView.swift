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
                ListMessageView()
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
            .navigationBarTitle(Text("Talks"))
            .navigationBarItems(
                leading:
                    HStack{
                        Button(action: {
                            print("new message")
                        }, label: {
                            Image(systemName: "video")
                                .foregroundColor(Color("barBlue"))
                                .font(.title3)
                            
                        })
                        Button(action: {
                            print("new message")
                        }, label: {
                            Image(systemName: "phone")
                                .foregroundColor(Color("barBlue"))
                                .font(.title3)
                            
                        })
                    },
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
