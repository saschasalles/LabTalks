//
//  GroupItemView.swift
//  LabTalks
//
//  Created by Sascha Sallès on 20/02/2021.
//

import SwiftUI

struct GroupItemView: View {
    let groupName: String
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.3.fill")
                .foregroundColor(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
            Text(self.groupName)
                .font(Font.system(.title3, design: .rounded))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
            HStack {
                Button(action: {
                    print("isFavorite")
                }, label: {
                    Image(systemName: "star.fill")
                        .foregroundColor(Color(.systemYellow))
                })
                Spacer()
                Image(systemName: "person.2.circle.fill")
                Text("21")
                    .font(Font.system(.body, design: .rounded))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .foregroundColor(Color("barBlue"))
        }
        .padding()
        .clipped()
        .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 140)
        .background(Color(.systemGray6))
        .cornerRadius(18)
    }
}

struct GroupItemView_Previews: PreviewProvider {
    static var previews: some View {
        GroupItemView(groupName: "Alternants")
    }
}
