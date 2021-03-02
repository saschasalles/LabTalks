//
//  GroupItemView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 20/02/2021.
//

import SwiftUI

struct GroupItemView: View {
    let groupName: String
    let groupMembersCount: Int
    var body: some View {
        Color(.systemGray6)
            .cornerRadius(22)
            .overlay(
                VStack(alignment: .center) {
                    Image(systemName: "person.3.fill")
                        .foregroundColor(Color(.systemGray4))
                    Spacer()
                    Text(self.groupName)
                        .font(Font.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                    Spacer()
                    HStack {
                        Button(action: {
                            print("isFavorite")
                        }, label: {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(.systemYellow))
                        })
                        Spacer()
                        Image(systemName: "person.2.circle.fill")
                        Text(String(groupMembersCount))
                            .font(Font.system(.body, design: .rounded))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .foregroundColor(Color("barBlue"))
                }.padding(15)
                .clipped()
            ).frame(height: 160)

    }
}

struct GroupItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroupItemView(groupName: "Alternants", groupMembersCount: 12)
    }
}
